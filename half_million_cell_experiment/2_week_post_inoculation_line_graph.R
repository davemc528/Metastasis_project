#read that week's csv file into the environment
IL17_week_two_in_vivo <- read_csv("~/Dropbox/Tulane/You_lab/Metastasis_project/MPC3/Experiments/Orthotopic_luciferase_imaging/IL17_metastasis_study/DMC20171002095728/IL17_week_two_in_vivo.csv")
log_con_2_week_mean <- log(mean(IL17_week_two_in_vivo$`Avg Radiance [p/s/cm_/sr]`[1:5])); log_con_2_week_se <- log(sd(IL17_week_two_in_vivo$`Avg Radiance [p/s/cm_/sr]`[1:5])/sqrt(5))
log_IL17_2_week_mean_lum <- log(mean(IL17_week_two_in_vivo$`Avg Radiance [p/s/cm_/sr]`[6:12]));log_IL17_2_week_mean_lum_se <- log(sd(IL17_week_two_in_vivo$`Avg Radiance [p/s/cm_/sr]`[6:12])/sqrt(7))
primary_tumor_growth_week_2 <- data.frame("post.surgery"=c(7,14),mean_lum=c(log_con_1_week_mean_lum,log_con_2_week_mean, log_IL17_1_week_mean_lum,log_IL17_2_week_mean_lum),lum_se=c(log_con_1_week_mean_lum_se,log_con_2_week_se,log_IL17_1_week_se,log_IL17_2_week_mean_lum_se),group=rep(c("con","IL17"),each=2))
install.packages("ggplot2")
p <- ggplot(data = primary_tumor_growth_week_2,mapping = aes(x=primary_tumor_growth_week_2$post.surgery,y=primary_tumor_growth_week_2$mean_lum,group=primary_tumor_growth_week_2$group,color=group))
p+geom_line(size=0.75)+geom_point(size=2)+theme_classic()+geom_errorbar(aes(ymax=primary_tumor_growth_week_2$mean_lum+lum_se,ymin=primary_tumor_growth_week_2$mean_lum-lum_se),size=0.75)+xlab("Days Post Inoculation")+ylab("Mean Radiance (log p/s/cm2/sr)")+scale_color_manual(values = cbbPalette)
