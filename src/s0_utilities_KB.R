
###---Set lists-----------------------------------------------------------------

phyla.cut <- c( "Euryarchaeota", #archaea
                "Chordata", #eukaryota
                "Thaumarchaeota" #archaea
              )

###---Set Colors----------------------------------------------------------------

drug_targets.pal <- c("Aminoglycosides"="#17486F",
                             "Beta_lactams"="#526741",
                             "Diaminopyrimidine"="#D29847",
                             "Fluoroquinolones"="#345B4D",
                             "Glycopeptides"="#356D8A",
                             "MLS"="#C06636",
                             "Multidrug_Class"="#e8b960",
                             "Nitroimidazole"="#396C70",
                             "Peptide"="#A24727",
                             "Phenicol"="#508ea2",
                             "Quatenary_Ammonium_Compounds"="#C9A757",
                             "Rifamycin"="#C8803E",
                             "Sulfonamides"="#827F43",
                             "Tetracyclines"="#802417")

drug_targets.pal2 <- list(Group=c(
                      Aminoglycosides="#17486F",
                      Beta_lactams="#526741",
                      Diaminopyrimidine="#D29847",
                      Fluoroquinolones="#345B4D",
                      Glycopeptides="#356D8A",
                      MLS="#C06636",
                      Multidrug_Class="#e8b960",
                      Peptide="#A24727",
                      Phenicol="#508ea2",
                      Sulfonamides="#827F43",
                      Tetracyclines="#802417"))

gene_name.pal <- c("AAC(6')"="#123653",
                   "ANT(3\"\")"="#17486F",
                   "ANT(6)"="#25587B",
                   "APH(3')"="#326987",
                   "APH(6)"="#407A93",
                   "bla_class_A"="#384D49",
                   "blaOXA"="#295044",
                   "blaKPC"="#436147",
                   "blaTEM"="#506642",
                   "dfrA1"="#D29847",
                   "DHFR_1"="#e8b960",
                   "ereD"="#8A4128",
                   "mefC"="#A24727",
                   "mphG"="#C06636",
                   "msrE"="#C8803E",
                   "catB"="#4A8597",
                   "mphE"="#4E94A9",
                   "sul1"="#827F43",
                   "tetA"="#802417",
                   "tetM"="#8F331E",
                   "tetX"="#9E4325")

gene_name.AT.pal <- c("AAC(6')-Ib9"="#153149",
                      "AAC(6')-Il"="#123653",
                      "aadS"="#17486F",
                      "ANT(3'')-IIa"="#25587B",
                      "APH(3'')-Ib"="#326987",
                      "APH(3')-Ia"="#407A93",
                      "APH(6)-Id"="#3782A4",
                      "ADC-19"="#304143",
                      "GES-1"="#384D49",
                      "OXA-10"="#295044",
                      "RSA-1"="#436147",
                      "VEB-9"="#506642",
                      "dfrA1"="#D29847",
                      "dfrB1"="#e8b960",
                      "ErmF"="#8A4128",
                      "mefC"="#A24727",
                      "EreD"="#C06636",
                      "mphG"="#C06636",
                      "msrE"="#C8803E",
                      "qacEdelta1"="#AC934D",
                      "qacL"="#C9A757",
                      "mphE"="#4A8597",
                      "sul1"="#827F43",
                      "sul2"="#9C9953",
                      "tet(39)"="#802417",
                      "tet(C)"="#8F331E")

###---Custom defined themes-----------------------------------------------------

theme_pub <- function() {
  
  color.background = "white"
  color.grid.major = "grey30"
  color.grid.minor = "grey60"
  color.axis.text = "#2a3132"
  color.axis.title = "#2a3132"
  color.title = "#2a3132"
  
  # Begin construction of chart
  theme_cowplot() +
    ggplot2::theme( 
      text = element_text(family = "Arial", size=8),
      line = element_line(size=0.3)
    ) +
    
    # Format the legend, hide by default
    ggplot2::theme(  
      #legend.position    = "bottom",
      legend.position    = "none",
      legend.margin      = margin(4, 4, 4, 4),
      legend.key.size    = unit(8, "pt"),
      legend.box.spacing = unit(4, "pt"),
      legend.text        = element_text(size=8, color = color.axis.title),
      legend.title       = element_text(size=10, face="bold")
    ) +
    
    # Set axis labels, text and format tick marks
    ggplot2::theme(  
      axis.text          = element_text(size=8),
      axis.text.x        = element_text(size = 8, angle = 0, color=color.axis.text, margin = margin(1, 0, 0, 0)),
      axis.text.y        = element_text(angle = 0, color=color.axis.text, margin = margin(0, 1, 0, 0)),
      axis.text.x.top    = element_text(margin = margin(0, 0, 1, 0)),
      axis.text.y.right  = element_text(margin = margin(0, 0, 0, 1)),
      axis.ticks         = element_line(size=0.3),
      axis.ticks.length  = unit(2, "pt"),
      
      axis.line          = element_line(size=0.3),
      axis.line.x        = element_line(size=0.3),
      axis.line.y        = element_line(size=0.3),
      
      axis.title         = element_text(size=10, face="bold", color = color.axis.title),
      axis.title.x.top   = element_text(margin = margin(0, 0, 2, 0)),
      axis.title.y.right = element_text(margin = margin(0, 0, 0, 2)),
      axis.title.x       = element_text(margin = margin(1, 0, 0.5, 0), vjust=0),
      axis.title.y       = element_text(margin = margin(0, 1, 0, 0.5), vjust=1.25)
    ) +
    
    # Format facet heading
    ggplot2::theme( 
      strip.text   = element_text(size=10, face="bold"),
      strip.text.x = element_text(margin = margin(3, 0, 1.5, 0)), 
      strip.text.y = element_text(margin = margin(0, 3, 0, 3)),
      # strip.background = element_rect(fill = "#efefef", color = "#2a3132"),
      strip.background   = element_blank()
    ) +
    
    ## Format the grid
    ggplot2::theme(
      #        panel.grid.major=element_line(color=color.grid.major,size=.50)) +
      #        panel.grid.minor=element_line(color=color.grid.minor,size=.50)) +
      panel.spacing      = unit(3, "pt")
    ) +
    
    # Format plot title and margin  
    ggplot2::theme(  
      plot.title = element_text(size=12, color=color.title),
      # plot.title = element_text(size=12, color=color.title, family = "Futura-Book"),
      # plot.margin = unit(c(0.35, 0.3, 0.35, 0.35), "cm"),
      plot.margin = margin(3, 3, 3, 3)
      
    )
}

### Old colors

phyla.colors <- c("Actinobacteria" = "#EFF3FF", #bacteria
                  "Bacteroidetes" = "#C6DBEF", #bacteria
                  "Candidatus Saccharibacteria" = "#9ECAE1", #bacteria
                  "Cyanobacteria" = "#6BAED6", #bacteria
                  "Firmicutes" = "#4292C6", #bacteria
                  "Proteobacteria" = "#2171B5", #bacteria
                  "Tenericutes" = "#084594", #bacteria
                  "Euryarchaeota" = "seagreen1", #archaea
                  "Chordata" = "firebrick1" #eukaryote
)

nb.cols <- 14
mycolors <- colorRampPalette(brewer.pal(8, "Set1"))(nb.cols)

more.phyla.colors <- c("Actinobacteria" = "#E64B35B2", #bacteria
                       "Bacteroidetes" = "#4DBBD5B2", #bacteria
                       "Candidatus Saccharibacteria" = "#00A087B2", #bacteria
                       "Cyanobacteria" = "#3C5488B2", #bacteria
                       "Firmicutes" = "#F39B7FB2", #bacteria
                       "Proteobacteria" = "#8491B4B2", #bacteria
                       "Tenericutes" = "#91D1C2B2", #bacteria
                       "Euryarchaeota" = "#DC0000B2", #archaea
                       "Chordata" = "#7E6148B2", #eukaryote
                       "Acidobacteria" = "gray70", #bacteria
                       "Chlorobi" = "#B09C85B2" #bacteria
)



topten.colors <- c("AAC(6')" = "#17486F", # Aminoglycosides
                   "APH(3')" = "#24587B", # Aminoglycosides
                   "ANT(3\"\")" = "#326987", # Aminoglycosides
                   "APH(6)" = "#407A93", # Aminoglycosides
                   "ANT(6)" = "#4E8BA0", # Aminoglycosides
                   
                   "blaTEM" = "#36686A", # Beta_lactams
                   "bla_class_A" = "#2D5B56", # Beta_lactams
                   "blaOXA" = "#345B4D", # Beta_lactams
                   "blaKPC" = "#31A354", # Beta_lactams
                   
                   "dfrA1" = "#FEE6CE", # Diaminopyrimidine
                   "DHFR_1" = "#E6550D", # Diaminopyrimidine
                   
                   "mphG" = "#F2F0F7", # MLS
                   "mefC" = "#CBC9E2", # MLS
                   "ereD" = "#9E9AC8", # MLS
                   "msrE" = "#6A51A3", # MLS
                   "mphE" = "#FDBF6F", # MLS
                   
                   "catB" = "#FFC0CB", # Phenicol
                   
                   "sul1" = "#FFFF00", # Sulfonamides
                   
                   "tetA" = "#FEE0D2", # Tetracyclines
                   "tetM" = "#FC9272", # Tetracyclines
                   "tetX" = "#DE2D26", # Tetracyclines
                   
                   "other" = "#b3b3b3"
)

topten.colors2 <- c("AAC(6')" = "#17486F", # Aminoglycosides
                    "APH(3')" = "#24587B", # Aminoglycosides
                    "ANT(3\"\")" = "#326987", # Aminoglycosides
                    "APH(6)" = "#407A93", # Aminoglycosides
                    "ANT(6)" = "#4E8BA0", # Aminoglycosides
                    
                    "blaTEM" = "#36686A", # Beta_lactams
                    "bla_class_A" = "#2D5B56", # Beta_lactams
                    "blaOXA" = "#345B4D", # Beta_lactams
                    "blaKPC" = "#426147", # Beta_lactams
                    
                    "catB" = "#5E6B3D", # Chloramphenicol
                    
                    "dfrA1" = "#968A49", # Diaminopyrimidine
                    "DHFR_1" = "#B59C51", # Diaminopyrimidine
                    
                    "mphG" = "#D29948", # MLS
                    "mefC" = "#D8A24F", # MLS
                    "ereD" = "#DFAB56", # MLS
                    "msrE" = "#E5B55D", # MLS
                    
                    "mphE" = "#C67A3C", # Phenicol
                    
                    "sul1" = "#AE532D", # Sulfonamides
                    
                    "tetA" = "#802401", # Tetracyclines
                    "tetM" = "#8F331E", # Tetracyclines
                    "tetX" = "#9E4325", # Tetracyclines
                    
                    "other" = "#b3b3b3"
)


product.colors <- c("#1F78B4", "#A6CEE3", "#6bb5db", "#33A02C", "#B2DF8A", "#E31A1C",  "#FB9A99",  "#FDBF6F", "#6A3D9A", "#B15928", "#b3b3b3"
)


# In METBREWER
## DEgas
## Redon - paired
## Tiepolo - paired
