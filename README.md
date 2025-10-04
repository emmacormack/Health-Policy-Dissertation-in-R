 # EC's Undergraduate Dissertation Research Project in Health Policy

This replicates the process I took to produce my undergraduate research project as part of my honours degree in Social and Public Policy at the University of Glasgow. I designed and researched a topical area of health policy, using quantitative and qualitative methods in the form of an online questionnaire and focus group. This project replicates the quantitative element, demonstrating my R modelling capabilities. **The data was generated using ChatGPT (see prompt below), to protect my real-world collected data.** Click here to download the excel file of fake data! 
[XLSX File of Fake Data!](https://github.com/user-attachments/files/22699242/example_patient_satisfaction_v3.xlsx)

### Which factors influence patient satisfaction with general practices in Scotland?

### Ordinal Logistic Regression Analysis ###
To analyse the data an ordinal logistic regression model was administered using the `polr()` function from the `MASS` package in R Studio. This type of model allows for comparison between satisfaction levels, while accounting for other factors. The model fit was tested with the McFadden R2 and the Proportional Regression Assumption, which identifies whether the model results can be relied upon. Odds ratios were used to interpret the results of the model for the significant (p <= 0.05variables in the model.

## Sample Demographics

<img width="200" height="250" alt="image" src="https://github.com/user-attachments/assets/1c74080b-edd0-4f07-bae2-e797f0e1034a" />

<img width="200" height="250" alt="image" src="https://github.com/user-attachments/assets/c591b0d7-1306-4c81-b298-38b9fc86dec7" />

<img width="200" height="250" alt="image" src="https://github.com/user-attachments/assets/94e2888f-d35b-42ca-95fa-2f3f28013e3d" />

<img width="300" height="200" alt="image" src="https://github.com/user-attachments/assets/29085d11-7e3b-46e0-8ec3-72d8b5607442" />

<img width="300" height="200" alt="image" src="https://github.com/user-attachments/assets/04eb9065-b184-4f98-ade2-a32f0593dd49" />

<img width="300" height="200" alt="image" src="https://github.com/user-attachments/assets/3b093a74-a645-47af-8668-de453b569f97" />

<img width="300" height="200" alt="image" src="https://github.com/user-attachments/assets/86689a21-8818-4891-ae14-50386b596ea3" />

<img width="300" height="200" alt="image" src="https://github.com/user-attachments/assets/1f2e0e52-8016-4857-b34c-804e95c115dc" />

## Ordered Logit Model

```
model1 <- polr(PATSAT ~ TRAVEL + APPTLOC + TIMELINESS + STAFFCOMS + EFFICACY + YRSWGP + COMPASSION + SAMEGP + CONNECT + MDTSTAFF + CLOSURE + AGE + NVISITS + EXPECTATION + GENDER + HEALTHSTAT + ETHNICITY + SIMD + RRCLASS, method = "logistic", data = exampledata)

summary(model1)

logLik(model1)

pR2(model1)
```


# Ordinal Logistic Regression Results


### Coefficients

| **Predictor** | **Estimate** | **Std. Error** | **t value** |
|----------------|--------------|----------------|-------------|
| **TRAVEL** |  |  |  |
| 10–20 mins | -0.45479 | 0.2940 | -1.5469 |
| 20–40 mins | -0.74425 | 0.3262 | -2.2815 |
| 40+ mins | -1.38694 | 0.4382 | -3.1647 |
| **APPTLOC** |  |  |  |
| GP surgery | 0.60069 | 0.3440 | 1.7462 |
| Hospital | 0.27468 | 0.4046 | 0.6788 |
| Online/telephone | -0.13646 | 0.5083 | -0.2685 |
| **TIMELINESS** |  |  |  |
| 2 | 0.49111 | 0.4000 | 1.2279 |
| 3 | 1.16224 | 0.3805 | 3.0541 |
| 4 | 1.92470 | 0.4045 | 4.7578 |
| 5 | 2.42384 | 0.4011 | 6.0423 |
| **STAFFCOMS** |  |  |  |
| 2 | 0.44489 | 0.3918 | 1.1355 |
| 3 | 0.83418 | 0.3720 | 2.2426 |
| 4 | 1.30081 | 0.3886 | 3.3476 |
| 5 | 1.71683 | 0.4146 | 4.1404 |
| **EFFICACY** |  |  |  |
| 2 | 0.98206 | 0.3915 | 2.5086 |
| 3 | 1.25358 | 0.3975 | 3.1540 |
| 4 | 1.90254 | 0.3847 | 4.9460 |
| 5 | 2.38453 | 0.4146 | 5.7514 |
| **YRSWGP** |  |  |  |
| 10–19 | -0.32740 | 0.7559 | -0.4331 |
| 20–39 | -0.51895 | 0.8185 | -0.6340 |
| 40–59 | -0.23569 | 0.9324 | -0.2528 |
| 60–79 | -0.24330 | 1.0209 | -0.2383 |
| **COMPASSION** |  |  |  |
| 2 | 1.25136 | 0.3793 | 3.2993 |
| 3 | 1.66891 | 0.3940 | 4.2361 |
| 4 | 2.35439 | 0.4100 | 5.7426 |
| 5 | 2.81376 | 0.3943 | 7.1367 |
| **SAMEGP** |  |  |  |
| 2 | -0.17429 | 0.3950 | -0.4413 |
| 3 | 0.62943 | 0.3829 | 1.6439 |
| 4 | 0.35979 | 0.4212 | 0.8542 |
| 5 | 0.16222 | 0.3737 | 0.4340 |
| **CONNECT** |  |  |  |
| 2 | -0.63108 | 0.3702 | -1.7048 |
| 3 | -0.37872 | 0.3932 | -0.9632 |
| 4 | 0.13307 | 0.3866 | 0.3442 |
| 5 | -0.90025 | 0.3898 | -2.3093 |
| **MDTSTAFF** |  |  |  |
| Yes | -0.16544 | 0.2674 | -0.6187 |
| **CLOSURE** |  |  |  |
| Yes | -1.15682 | 0.3377 | -3.4255 |
| **AGE** |  |  |  |
| 30–49 | -0.28160 | 0.7147 | -0.3940 |
| 50–69 | -0.79087 | 0.8561 | -0.9238 |
| 70–89 | -0.62715 | 0.9681 | -0.6478 |
| **NVISITS** |  |  |  |
| 3–7 | 0.40408 | 0.3416 | 1.1831 |
| 8–11 | 0.96223 | 0.4689 | 2.0521 |
| 12–14 | 0.95867 | 0.9312 | 1.0296 |
| **EXPECTATION** |  |  |  |
| 2 | -0.79665 | 0.3973 | -2.0051 |
| 3 | -0.53735 | 0.4087 | -1.3147 |
| 4 | -1.13734 | 0.3821 | -2.9764 |
| 5 | -0.73788 | 0.3807 | -1.9382 |
| **GENDER** |  |  |  |
| Male | -0.31434 | 0.2583 | -1.2167 |
| Other | -0.85482 | 0.5592 | -1.5286 |
| **HEALTHSTAT** |  |  |  |
| 2 | -0.58497 | 0.4055 | -1.4427 |
| 3 | 0.35923 | 0.3836 | 0.9365 |
| 4 | -0.63375 | 0.4006 | -1.5820 |
| 5 | -0.59120 | 0.3912 | -1.5112 |
| **ETHNICITY** |  |  |  |
| Black | -0.32794 | 0.6217 | -0.5275 |
| Mixed | 0.05776 | 0.6830 | 0.0846 |
| Other | -0.66753 | 0.7045 | -0.9476 |
| White | -0.11127 | 0.4248 | -0.2619 |
| **SIMD** |  |  |  |
| 2 | 0.21353 | 0.3837 | 0.5564 |
| 3 | -0.34252 | 0.3901 | -0.8781 |
| 4 | 0.60367 | 0.4155 | 1.4529 |
| 5 | -0.27381 | 0.3849 | -0.7114 |
| **RRCLASS** |  |  |  |
| 2 | -0.09474 | 0.4401 | -0.2153 |
| 3 | -0.01926 | 0.4652 | -0.0414 |
| 4 | 0.22316 | 0.4320 | 0.5165 |
| 5 | -0.35117 | 0.4062 | -0.8645 |
| 6 | 0.20792 | 0.4213 | 0.4936 |

---

### Intercepts

| **Threshold** | **Estimate** | **Std. Error** | **t value** |
|----------------|--------------|----------------|-------------|
| 1 \| 2 | -0.3464 | 1.1447 | -0.3026 |
| 2 \| 3 | 1.7781 | 1.1456 | 1.5522 |
| 3 \| 4 | 3.6605 | 1.1616 | 3.1512 |
| 4 \| 5 | 5.6233 | 1.1932 | 4.7126 |

---

### Model Fit

| **Statistic** | **Value** |
|----------------|-----------|
| Residual Deviance | 722.1547 |
| AIC | 860.1547 |

### Odds Ratios
```
tidy_model <- broom::tidy(model1, conf.int = TRUE, exponentiate = TRUE)

tidy_model <- tidy_model %>% mutate(p.value = 2 * (1 - pnorm(abs(statistic))),   # calculate p-values
                                    sig = ifelse(p.value < 0.05, "Significant", "Not significant"))
                                    
# Plotting Odds Ratios, Coloured by Significance

ggplot(tidy_model, aes(x = reorder(term, estimate), y = estimate, colour = sig)) +
  geom_point(size = 3) +
  geom_errorbar(aes(ymin = conf.low, ymax = conf.high), width = 0.2) +
  geom_hline(yintercept = 1, linetype = "dashed", colour = "grey40") +
  coord_flip() +
  scale_colour_manual(values = c("Significant" = "cadetblue", "Not significant" = "#d95f02")) +
  theme_minimal()

# Plotting only significant odds ratios

# Filter to include only significant terms
tidy_sig <- tidy_model %>%
  filter(sig == "Significant")

# Plot
ggplot(tidy_sig, aes(x = reorder(term, estimate), y = estimate, colour = sig)) +
  geom_point(size = 3) +
  geom_errorbar(aes(ymin = conf.low, ymax = conf.high), width = 0.2) +
  geom_hline(yintercept = 1, linetype = "dashed", colour = "grey40") +
  coord_flip() +
  scale_colour_manual(values = c("Significant" = "cadetblue")) +
  labs(
    title = "Significant Odds Ratios from Ordinal Logistic Regression",
    x = "Predictor",
    y = "Odds Ratio (95% CI)"
  ) +
  theme_minimal() + 
  geom_text(aes(label = round(estimate, 2)), hjust = -0.3, size = 3)
```

<img width="1001" height="516" alt="image" src="https://github.com/user-attachments/assets/3578c6db-b927-484f-8de7-ca01dea91c25" />

## References

literature

packages

ChatGPT prompt to generate data:


