#constructing kaplan-meier curve; need to play around with the aesthetics
kaplan_meier_data <- read_csv("~/Box/Metastasis_project/Metastasis_project_data_analysis/R_file/half_million_cell_experiment/kaplan_meier_data.csv")
#install ggplot2 as well
library("survival", lib.loc="~/Library/R/3.3/library")
library("survminer", lib.loc="~/Library/R/3.3/library")
library("ggfortify", lib.loc="~/Library/R/3.3/library")
sfit <- surv_fit(Surv(survival.time,status)~group,data = kaplan_meier_data)
library("survminer", lib.loc="~/Library/R/3.3/library")
ggsurvplot(sfit)
survdiff(Surv(survival.time)~group,data = kaplan_meier_data)
