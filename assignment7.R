library(ggplot2)
library(plotly)
library(DT)

# 导入数据
pub_211 <- read.csv("~/learngit/a7-dashboard-dianwang97/pub_211.csv")

# 一个含时间趋势的散点图
ggplot(data = pub_211, aes(x = pubyear, y = pubnum_wos)) +
  geom_point(size = 4) +
  geom_line(color = "#EFC000FF", size = 1) +
  xlab("发表年份") + ylab("WOS发表数量")
  labs(x = "pubnum", y = "pubnum_wos") +
  theme_light()
  
# 一个交互图
plot_ly(data = pub_211, x = ~pubyear, y = ~pubnum_wos, type = "scatter", mode = "markers") %>%
  layout(title = "各年份论文发表数量交互图",
         xaxis = list(title = "发表年份"),
         yaxis = list(title = "WOS发表数量"))

# 一个表格
datatable(pub_211, options = list(pageLength = 10))

# 一些说明性文本
scatter_plot <- plot_ly(data = pub_211, x = ~pubyear, y = ~pubnum_wos, type = "scatter", mode = "markers") %>%
  layout(title = "各年份论文发表数量交互图",
         xaxis = list(title = "发表年份"),
         yaxis = list(title = "WOS发表数量"))
text_labels <- list(x = c(2010, 2011, 2012, 2013, 2014), y = c(1000, 1500, 2000, 2500, 3000),
         text = c("Point 1", "Point 2", "Point 3", "Point 4", "Point 5"), showarrow = FALSE,
         font = list(color = "darkgreen", size = 14))

# 解释性文本添加到图表中
scatter_plot <- scatter_plot %>% add_trace(type = "scatter", mode = "text", text = text_labels)
scatter_plot
