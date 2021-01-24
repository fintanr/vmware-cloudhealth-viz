library("tidyverse")

df <- read.csv("data.csv")
vgather <- gather(df, Category, Percent, -Vertical)

dv <- ggplot(vgather, aes(Category, Percent)) +
    geom_bar(stat = "identity", aes(fill = Category)) + 
    facet_wrap(~ Vertical, ncol = 3)  +
    theme(
        axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank(), 
        legend.position="bottom", 
        legend.key.size = unit(0.2, "cm")) + 
    ylab("Percentage Change vs 2019") +
    labs(title="Quick DataViz of How 2020 Changed The Way We Use Cloud\nfrom CloudHealth by VMware", 
        caption = "DataViz: @fintanr\n
            Caveats: Interpret with care
            Data extracted from report, number of customers is unknown, date ranges vary by vertical
            Data is implicitly biased by how its collected and collated
            Zero values where no data was present in report
            Full report at https://www.cloudhealthtech.com/blog/2020-cloud-spend-report")

ggsave("vmware-cloudhealth-2020-change.png", dv)