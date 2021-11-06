library(tidyverse)
library(openxlsx)
library(readxl)
library(reshape2)
library(ggtext)
read_excel("depression.xlsx")->data
data.frame(data)->data
colnames(data)<-c("Group","Value2021","Value2020")
ggplot(data)+
  geom_segment(aes(x=Value2020,xend=Value2021,y=Group,yend=Group),color="#eeeeee",size=5.5,alpha=0.3)+
  geom_point(aes(x=Value2020,y=Group),fill="#ff9a9a",color="#ff9a9a",pch=21,size=5,alpha=0.6)+
  geom_point(aes(x=Value2021,y=Group),fill="#ff4815",color="#ff4815",pch=21,size=5,alpha=1)+
  scale_y_discrete(limits=rev)+
  theme(plot.background= element_rect(fill="black"),
        panel.background = element_rect(fill="black"),
        panel.grid = element_blank(),
        axis.ticks=element_blank(),
        axis.title.y = element_blank(),
        axis.title.x = element_text(colour = "#eaeaea",size = 12,margin=margin(t=12),face="bold"),
        axis.text = element_text(colour="#dddddd",face = "bold",size=12),
        plot.margin = unit(c(0.5,1,0.5,1),"cm"),
        plot.title.position = "plot",
        plot.caption.position = "plot",
        plot.title = element_markdown(face="bold",size=16,margin=margin(b=15)),
        plot.subtitle = element_markdown(face="bold",size=12,margin=margin(b=15)),
        plot.caption = element_text(colour="#f8f8f8",size=10,margin=margin(t=15),hjust=0))+
  labs(x="Rates of depression symptoms (in %)",
       title = "<span style='color:#f8f8f8'>DEPRESSION SYMPTOMS SURGE <span style='color:#ff4815'>POST-COVID19</span>",
       subtitle="<span style='color:#f8f8f8'>Rates of depression symptoms across all groups of people climbed in <span style='color:#ff4815'>early 2021 (January to March) <span style='color:#f8f8f8'><br>when compared to the period<span style='color:#ff9a9a'> before the pandemic (July 2019 to March 2020)</span>",
       caption = "Data: @DiversityinData | Design: @annapurani93")->plot2

ggsave("dumbbellplot.png",plot2, width=10,height=11)
ggsave("dumbbellplot.pdf",plot2, width=10,height=11,dpi=600,device=cairo_pdf)
