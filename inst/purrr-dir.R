library(magrittr)
library(tidyverse)
library(arxiv)

# list.files("~/Google Drive/Articles")
# [1] "Additive Models & Trees"       "Anomaly Detection"
# [3] "Audio Processing"              "Bayesian Deep Learning"
# [5] "Bayesian Nonparametrics"       "Bayesian Optimization"
# [7] "Bayesian Statistics"           "Causality"
# [9] "Concentration of Measure"      "Convolutional Neural Networks"
# [11] "Deep Learning"                 "Determinantal Processes"
# [13] "Distributed Systems"           "Economics"
# [15] "GANs"                          "Kernel Methods"
# [17] "Machine Learning"              "Maniforld Learning"
# [19] "MCMC"                          "Misc"
# [21] "Multi Arm Bandits"             "NLP"
# [23] "Nonlinear Filtering"           "Nonparametric Statistics"
# [25] "Optimization"                  "Probabilistic Numerics"
# [27] "Probabilistic Programming"     "Random Graphs"
# [29] "Random Matrices"               "Recurrent Neural Networks"
# [31] "Reinforcement Learning"        "Spark"
# [33] "Sparse Coding & Regression"    "Speech Recognition"
# [35] "Statistical Inference"         "Stochastic Analysis"
# [37] "Sufficient Cause"              "Systems"
# [39] "Time Series"                   "Topic Modeling"
# [41] "Variational Inference"


new <- rbind(
  # c("https://arxiv.org/pdf/1710.10742.pdf", "Probabilistic Programming"),
  # c("https://arxiv.org/pdf/1710.11417.pdf", "Reinforcement Learning"),
  # c("https://arxiv.org/pdf/1703.07326.pdf", "Reinforcement Learning"),
  # c("https://arxiv.org/pdf/1706.06383.pdf", "Reinforcement Learning"),
  # c("https://arxiv.org/pdf/1706.06122.pdf", "Reinforcement Learning"),
  # c("https://arxiv.org/pdf/1710.10903.pdf", "Deep Learning"),
  # c("https://arxiv.org/pdf/1611.08402.pdf", "Convolutional Neural Networks"),
  # c("https://arxiv.org/pdf/1710.10547.pdf", "Deep Learning"),
  # c("https://arxiv.org/pdf/1710.10348.pdf", "Deep Learning"),
  # c("https://arxiv.org/pdf/1710.09829.pdf", "Deep Learning"),
  # c("https://arxiv.org/pdf/1710.06451.pdf", "Bayesian Deep Learning"),
  # c("https://arxiv.org/pdf/1705.07704.pdf", "Deep Learning"),
  # c("https://arxiv.org/pdf/1711.00165.pdf", "Bayesian Deep Learning"),
  # c("https://arxiv.org/pdf/1710.06451.pdf", "Bayesian Deep Learning"),
  # c("https://arxiv.org/pdf/1711.00489.pdf", "Optimization"),
  # c("https://arxiv.org/pdf/1401.5398.pdf", "Bayesian Statistics"),
  # c("https://arxiv.org/pdf/1610.05559.pdf", "Bayesian Statistics"),
  # c("https://arxiv.org/pdf/1711.00970.pdf", "GANs"),
  # c("https://arxiv.org/pdf/1711.00436.pdf", "Deep Learning"),
  # c("https://arxiv.org/pdf/1710.09867.pdf", "NLP"),
  # c("https://arxiv.org/pdf/1711.00043.pdf", "NLP"),
  # c("https://arxiv.org/pdf/1710.10777.pdf", "NLP"),
  # c("https://arxiv.org/pdf/1711.01068.pdf", "NLP"),
  # c("https://arxiv.org/pdf/1711.02013.pdf", "NLP"),
  # c("https://arxiv.org/pdf/1711.00740.pdf", "NLP"),
  # c("https://arxiv.org/pdf/1711.01068.pdf", "NLP")

  # c("https://arxiv.org/pdf/1710.04340.pdf", "Deep Learning"),
  # c("https://arxiv.org/pdf/1710.11622.pdf", "Deep Learning"),
  # c("https://arxiv.org/pdf/1611.01734.pdf", "NLP"),
  # c("https://arxiv.org/pdf/1711.00807.pdf", 'Stochastic Analysis'),
  # c("https://arxiv.org/pdf/1703.01041.pdf", "Convolutional Neural Networks"),
  # c("https://arxiv.org/pdf/1710.11041.pdf", "NLP")

  # c("https://arxiv.org/pdf/1711.03953.pdf", "NLP"),
  # c("https://arxiv.org/pdf/1608.05859.pdf", "NLP"),
  # c("https://arxiv.org/pdf/1711.01134.pdf", "Statistical Inference")
  # c("https://arxiv.org/pdf/1711.02838.pdf", "Optimization"),
  # c("https://arxiv.org/pdf/1711.02836.pdf", "MCMC"),
  # c("https://arxiv.org/pdf/1711.03167.pdf", "GANs"),
  # c("https://arxiv.org/pdf/1611.01540.pdf", "Optimization")
  # c("https://arxiv.org/pdf/1704.08795.pdf", "Reinforcement Learning"),
  # c("https://arxiv.org/pdf/1710.06570.pdf", "Optimization"),
  # c("https://arxiv.org/pdf/1706.06551.pdf", "Reinforcement Learning"),
  # c("https://arxiv.org/pdf/1703.06585.pdf", "Reinforcement Learning"),
  # c("https://arxiv.org/pdf/1703.05423.pdf", "Deep Learning")
  # c("https://arxiv.org/pdf/1703.09831.pdf", "Reinforcement Learning"),
  # c("https://arxiv.org/pdf/0805.3043.pdf", "Statistical Inference"),
  # c('https://arxiv.org/pdf/1705.03122.pdf', "NLP"),
  # c("https://arxiv.org/pdf/1711.05217v1.pdf", "NLP"),
  # c("https://arxiv.org/pdf/1703.03130.pdf", "NLP"),
  # c('https://arxiv.org/pdf/1412.2007.pdf', 'NLP'),
  # c("https://arxiv.org/pdf/1708.08147.pdf", "NLP"),
  # c("https://arxiv.org/pdf/1711.09576.pdf", "NLP"),
  # c("https://arxiv.org/pdf/1711.08770.pdf", "Machine Learning"),
  # c("https://arxiv.org/pdf/1711.08646.pdf", "GANs"),
  # c("https://arxiv.org/pdf/1704.06918.pdf", "NLP"),
  # c("https://arxiv.org/pdf/1706.06551.pdf", "Reinforcement Learning"),
  # c("https://arxiv.org/pdf/1711.07553.pdf", "Convolutional Neural Networks"),
  # c('https://arxiv.org/pdf/1711.07758.pdf', "Deep Learning"),
  # c("https://arxiv.org/pdf/1711.06351.pdf", "NLP"),
  # c("https://arxiv.org/pdf/1711.06788.pdf", "Recurrent Neural Networks"),
  # c("https://arxiv.org/pdf/1707.00683.pdf", "NLP"),
  # c("https://arxiv.org/pdf/1711.09534.pdf", "NLP"),
  # c("https://arxiv.org/pdf/1709.07432.pdf", "NLP"),
  # c("https://arxiv.org/pdf/1606.05336.pdf", "Deep Learning"),
  # c("https://arxiv.org/pdf/1711.11179.pdf", "Recurrent Neural Networks"),
  # c("https://arxiv.org/pdf/1706.07567.pdf", "Deep Learning"),
  # c("https://arxiv.org/pdf/1705.07283.pdf", "Bayesian Deep Learning"),
  # c("https://arxiv.org/pdf/1710.10571.pdf", "Optimization"),
  # c("https://arxiv.org/pdf/1711.00740.pdf", "Program Synthesis"),
  # c("https://arxiv.org/pdf/1711.04894.pdf", "GANs")
  # c("https://arxiv.org/pdf/1705.08821.pdf", "Causality"),
  # c("https://arxiv.org/pdf/1702.00458.pdf", "Deep Learning"),
  # c("https://arxiv.org/pdf/1706.02815.pdf", "Bayesian Deep Learning"),
  # c("https://arxiv.org/pdf/1706.04208.pdf", "Reinforcement Learning"),
  # c("https://arxiv.org/pdf/1710.04157.pdf", "Program Synthesis"),
  # c("https://arxiv.org/pdf/1711.05411.pdf", "Recurrent Neural Networks"),
  # c("https://arxiv.org/pdf/1705.05427.pdf", "Reinforcement Learning"),
  # c("https://arxiv.org/pdf/1712.01038.pdf", "Variational Inference"),
  # c("https://arxiv.org/pdf/1711.02132.pdf", "NLP"),
  # c("https://arxiv.org/pdf/1711.03602.pdf", "NLP"),
  # c("https://arxiv.org/pdf/1712.02046.pdf", "Machine Learning"),
  # c("https://arxiv.org/pdf/1711.08534.pdf", "Machine Learning"),
  # c("https://arxiv.org/pdf/1707.09627.pdf", "Program Synthesis"),
  # c("https://arxiv.org/pdf/1711.09883.pdf", "AI Safety"),
  # c('https://arxiv.org/pdf/1711.09846.pdf', 'Deep Learning'),
  # c("https://arxiv.org/pdf/1707.08616.pdf", "Reinforcement Learning"),
  # c("https://arxiv.org/pdf/1410.3831.pdf" , "Deep Learning"),
  # c("https://arxiv.org/pdf/1707.06203.pdf", "Reinforcement Learning"),
  # c("https://arxiv.org/pdf/1610.01206.pdf", "Machine Learning"),
  # c("https://arxiv.org/pdf/1712.01208.pdf", "Deep Learning"),
  # c("https://arxiv.org/pdf/1712.01435.pdf", "Bayesian Nonparametrics"),
  # c("https://arxiv.org/pdf/1712.00484.pdf", "Sparse Coding & Regression"),
  # c("https://arxiv.org/pdf/1711.11280.pdf", "Gaussian Processes"),
  # c("https://arxiv.org/pdf/1711.11561.pdf", "Convolutional Neural Networks"),
  # c("https://arxiv.org/pdf/1712.04120.pdf", "Bayesian Deep Learning"),
  # c("https://arxiv.org/pdf/1702.01923.pdf", "NLP"),
  # c("https://arxiv.org/pdf/1712.04741.pdf", "Deep Learning"),
  # c("https://arxiv.org/pdf/1701.03185.pdf", "NLP")
  # c("https://arxiv.org/abs/1712.01769", "NLP"),
  # c("https://arxiv.org/abs/1605.07891", "NLP"),
  # c('https://arxiv.org/pdf/1703.09831.pdf', "NLP"),
  # c("https://arxiv.org/pdf/1711.11216.pdf", "Deep Learning"),
  # c("https://arxiv.org/pdf/1712.06567.pdf", "Neuroevolution"),
  # c("https://arxiv.org/abs/1712.06563", "Neuroevolution"),
  # c("https://arxiv.org/abs/1712.06568", "Neuroevolution"),
  # c("https://arxiv.org/abs/1712.06560", "Neuroevolution"),
  # c("https://arxiv.org/abs/1711.01012", "Reinforcement Learning"),
  # c("https://arxiv.org/pdf/1703.09912.pdf", "Deep Learning"),
  # c("https://arxiv.org/abs/1712.07316", "Reinforcement Learning")
  # c("https://arxiv.org/abs/1712.05889", "Reinforcement Learning"),
  # c("https://arxiv.org/abs/1712.06536", "Bayesian Nonparametrics"),
  # c('https://arxiv.org/abs/1711.00436', "Reinforcement Learning"),
  # c("https://arxiv.org/pdf/1701.03185.pdf", "NLP"),
  # c("https://arxiv.org/pdf/1712.00409.pdf", "Deep Learning"),
  # c("https://arxiv.org/abs/1602.01783", "Reinforcement Learning"),
  # c("https://arxiv.org/abs/1612.07837", "Speech Recognition"),
  # c('https://arxiv.org/abs/1711.10433', 'Speech Recognition'),
  # c("https://arxiv.org/abs/1603.06021", 'NLP'),
  # c("https://arxiv.org/pdf/1712.07185.pdf", "Reinforcement Learning"),
  # c("https://arxiv.org/abs/1702.01923", "NLP"),
  # c("https://arxiv.org/abs/1705.02364", "NLP"),
  # c("https://arxiv.org/pdf/1511.05641.pdf", "Deep Learning"),
  # c("https://arxiv.org/abs/1712.09127", "NLP"),
  # c("https://arxiv.org/abs/1712.09097", "MCMC"),
  # c("https://arxiv.org/pdf/1712.08880.pdf", "Machine Learning"),
  # c("https://arxiv.org/pdf/1712.09405.pdf", "NLP")
  # c("https://arxiv.org/pdf/1609.05807.pdf", "Fairness"),
  # c("https://arxiv.org/abs/1511.05641", "Deep Learning"),
  # c("https://arxiv.org/abs/1706.08224", "GANs"),
  # c("https://arxiv.org/pdf/1503.00095.pdf", "NLP"),
  # c("https://arxiv.org/pdf/1709.08878.pdf", "NLP"),
  # c("https://arxiv.org/pdf/1704.01212.pdf", "Deep Learning"),
  # c("https://arxiv.org/pdf/1712.09444.pdf", "NLP"),
  # c("https://arxiv.org/abs/1712.09662", "NLP"),
  # c("https://arxiv.org/abs/1607.07086", "NLP"),
  # c("https://arxiv.org/pdf/1606.02960.pdf", "NLP"),
  # c('https://arxiv.org/abs/1705.08439', "Reinforcement Learning"),
  # c("https://arxiv.org/abs/1702.08431", "GANs")
  c("https://arxiv.org/pdf/1706.04859.pdf", "Deep Learning"),
  c("https://arxiv.org/pdf/1710.10766.pdf", "GANs"),
  c("https://arxiv.org/pdf/1801.00173.pdf", "Deep Learning"),
  c("https://arxiv.org/abs/1712.09444", "Speech Recognition"),
  c("https://arxiv.org/abs/1609.03193", "Speech Recognition"),
  c("https://arxiv.org/pdf/1705.02601.pdf", "Misc"),
  c("https://arxiv.org/abs/1401.1803", "NLP"),
  c("https://arxiv.org/pdf/1312.6173.pdf", "NLP"),
  c("https://arxiv.org/pdf/1602.03483.pdf", "NLP"),
  c("https://arxiv.org/abs/1512.05287", "Bayesian Deep Learning"),
  c("https://arxiv.org/pdf/1611.05431.pdf", "Convolutional Neural Networks"),
  c("https://arxiv.org/pdf/1707.07012.pdf", "Convolutional Neural Networks"),
  c("https://arxiv.org/pdf/1608.06993.pdf", "Convolutional Neural Networks"),
  c("https://arxiv.org/pdf/1801.03326.pdf", "Reinforcement Learning")
  ) %>%
  as.data.frame(stringsAsFactors = F)


new %>% rename(surl = V1, dir = V2) %>%
  mutate(fpath = file.path("~/Google Drive/Articles", dir)) %>%
  mutate(title = map_chr(.x = surl, .f = create_filename)) -> old

old %>%
  select(surl, fpath) %>%
  unname() %>%
  pmap(download_paper)
  # map2(.x = .$surl, .y = .$fpath, .f = download_paper) -> old
  # map(function(x) download_paper(arx_url = x$surl, loc = x$fpath))


# download_paper(arx_url = "https://arxiv.org/pdf/1710.00095.pdf",
#               loc = file.path("~/Dropbox/Articles", "MCMC"))
