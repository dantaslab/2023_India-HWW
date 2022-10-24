
# Filter ShortBRED data
filter_shortbred_data <- function(df, min_rpkm = 0, prev = 0.01, var = 0, flag = TRUE){
  
  df <- shortbred.data
  shortbred.rpkm.df <- df$args.rpkm
  shortbred.markers.df <- df$markers
  
  print(paste("ShortBred filtering criteria: Keep markers if its relab >", min_rpkm, "in more than ", (prev)*100,"% of the samples"))
  
  print(paste("Number of rows before filtering:", nrow(shortbred.rpkm.df)))
  print(paste("Total number of markers:", nrow(shortbred.markers.df)))
  
  ## Filter by AMR_family and then keep markers that belongs to those AMR gene families
  rpkm.df <- shortbred.rpkm.df %>%
    inner_join(shortbred.markers.df, by = c("Shortbred_ID")) %>% 
    dplyr::group_by(sample_ID, AMR_Mechanism, AMR_Class, AMR_Family) %>%
    dplyr::summarise(Total_rpkm = sum(RPKM)) %>% 
    ungroup()
  
  markers.df <- rpkm.df %>% 
    group_by(AMR_Mechanism, AMR_Class, AMR_Family) %>% 
    dplyr::summarise( Mean_rpkm = mean(Total_rpkm, na.rm = T),
                      # Total_rpkm = sum(Total_rpkm),
                      Variance = var(Total_rpkm, na.rm = T),
                      Stdev = sd(Total_rpkm, na.rm = T),
                      Cnt = sum(Total_rpkm > 0),
                      Prev = mean(!is.na(Total_rpkm) & (Total_rpkm > 0)),
    ) %>%
    # filter(Cnt >= 5) %>% 
    dplyr::ungroup()
  
  # tmp_rpkm <- quantile(with(marker.df, mean_rpkm[mean_rpkm > 0]), 0.1)
  # tmp_rpkm <- min_rpkm
  # tmp_prev <- prev
  tmp_var <- quantile(with(markers.df, Variance[Variance > !!var]), 0.1)
  
  markers.fltrd.df <- markers.df %>% 
    filter(Mean_rpkm > !!min_rpkm,
           Prev >= !!prev,
           Variance >= !!tmp_var)
  
  print(paste("Number of AMR families after filtering: ", nrow(markers.fltrd.df)))
  
  shortbred.markers.df <- shortbred.markers.df %>% 
    filter(AMR_Family %in% markers.fltrd.df$AMR_Family) %>% 
    filter(Prev > 0)
  
  ## Filter by manually curated column "TD_Analysis" that contains information which markers should be included in the analysis
  if(flag){
    shortbred.markers.df <- shortbred.markers.df %>% dplyr::filter(TD_Analysis == "Yes")

  }

  
# Processing
  shortbred.rpkm.df <- shortbred.rpkm.df %>% 
    dplyr::filter(Shortbred_ID %in% shortbred.markers.df$Shortbred_ID)
  
  print(paste("Number of rows after filtering: ", nrow(shortbred.rpkm.df)))
  print(paste("Number of markers: ", length(unique(shortbred.rpkm.df$Shortbred_ID))))
  
  shortbred.data <- list( "markers" = shortbred.markers.df,
                              "args.rpkm" = shortbred.rpkm.df)
  
  return(shortbred.data)
  
}


###---Plotting------------------------------------------------------------------



###---Diversity index-----------------------------------------------------------

##
## Calculate Alpha diversity indices:
##
## 1) Species Richness i.e total number of unique species present in a community
##
## 2) Shannon's index (H): takes into account both abundance and evenness 
##    of species in the community.
##    Higher value of H would indicate diverse and equally distributed 
##    community and lower values represent lower diversity.
##    
## 3) Simson's Index: This takes into account the number of species as well 
##    as the abundance of each species 
##

calc_diversityIndices <- function(df){
  
  matrix <- as.matrix(df[,-1])    
  row.names(matrix) <- df[,1]
  
  div <- data.frame("SampleId" = as.character(row.names(matrix)))
  
  alpha_rich <- specnumber(matrix)
  div["Richness"] <- alpha_rich
  
  alpha_shn <- vegan::diversity(matrix, MARGIN=1, index="shannon")
  div["Shannon"] <- alpha_shn
  
  # alpha_simp = diversity(matrix, index="simpson")  
  # div["Simpson"] <- alpha_simp
  
  colnames(div) <- c("SampleId", "Richness", "Shannon")
  # colnames(div) <- c("SampleId", "Richness", "Shannon","Simpson")
  
  #median(alpha_shn)
  #mean(alpha_shn)
  #summary(alpha_shn)  
  
  return(div)
}
