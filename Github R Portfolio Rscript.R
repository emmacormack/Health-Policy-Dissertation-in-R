# Load packages and open data

library(MASS)
library(car)
library(pscl)
library(foreign)
library(brant)
library(VGAM)
library(ggplot2)
library(broom)
library(dplyr)
library(readxl)
exampledata <- read_excel("C:/Users/emmal/Downloads/example_patient_satisfaction_v3.xlsx")
View(exampledata)

# Remove option for orthogonal polynomial contrasts
options(contrasts = c("contr.treatment", "contr.treatment"))

# patient satisfaction distribution
ggplot(exampledata, aes(PATSAT)) + geom_histogram(bins = 10)

# Reorder variables -------------------------------------------------------

exampledata$PATSAT <- ordered(as.factor(exampledata$PATSAT))
table(exampledata$PATSAT)

exampledata$TRAVEL <- ordered(as.factor(exampledata$TRAVEL))
table(exampledata$TRAVEL)

exampledata$APPTLOC <- ordered(as.factor(exampledata$APPTLOC))
table(exampledata$APPTLOC)

exampledata$TIMELINESS <- ordered(as.factor(exampledata$TIMELINESS))
table(exampledata$TIMELINESS)

exampledata$STAFFCOMS <- ordered(as.factor(exampledata$STAFFCOMS))
table(exampledata$STAFFCOMS)

exampledata$EFFICACY <- ordered(as.factor(exampledata$EFFICACY))
table(exampledata$EFFICACY)

exampledata$YRSWGP <- ordered(as.factor(exampledata$YRSWGP))
table(exampledata$YRSWGP)

exampledata$COMPASSION <- ordered(as.factor(exampledata$COMPASSION))
table(exampledata$COMPASSION)

exampledata$SAMEGP <- ordered(as.factor(exampledata$SAMEGP))
table(exampledata$SAMEGP)

exampledata$CONNECT <- ordered(as.factor(exampledata$CONNECT))
table(exampledata$CONNECT)

exampledata$MDTSTAFF <- ordered(as.factor(exampledata$MDTSTAFF))
table(exampledata$MDTSTAFF)

exampledata$CLOSURE <- ordered(as.factor(exampledata$CLOSURE))
table(exampledata$CLOSURE)

exampledata$AGE <- ordered(as.factor(exampledata$AGE))
table(exampledata$AGE)

exampledata$NVISITS <- ordered(as.factor(exampledata$NVISITS))
table(exampledata$NVISITS)

exampledata$EXPECTATION <- ordered(as.factor(exampledata$EXPECTATION))
table(exampledata$EXPECTATION)

exampledata$GENDER <- ordered(as.factor(exampledata$GENDER))
table(exampledata$GENDER)

exampledata$HEALTHSTAT <- ordered(as.factor(exampledata$HEALTHSTAT))
table(exampledata$HEALTHSTAT)

exampledata$ETHNICITY <- ordered(as.factor(exampledata$ETHNICITY))
table(exampledata$ETHNICITY)

exampledata$SIMD <- ordered(as.factor(exampledata$SIMD))
table(exampledata$SIMD)

exampledata$RRCLASS <- ordered(as.factor(exampledata$RRCLASS))
table(exampledata$RRCLASS)


# Sample Demographics -----------------------------------------------------

ggplot(exampledata, aes(AGE)) + geom_bar(fill = "darkseagreen2") +
  labs(
    title = "Age Distribution",
    x = "Age",
    y = "count"
  ) +
  theme_minimal()

ggplot(exampledata, aes(GENDER)) + geom_bar(fill = "seagreen") +
  labs(
    title = "Gender Distribution",
    x = "Gender",
    y = "count"
  ) +
  theme_minimal()

ggplot(exampledata, aes(ETHNICITY)) + geom_bar(fill = "darkseagreen")+
  labs(
    title = "Ethnicity Distribution",
    x = "Ethnicity",
    y = "count"
  ) +
  theme_minimal()

ggplot(exampledata, aes(RRCLASS)) + geom_bar(fill = "darkgreen") +
  labs(title = "Significant Odds Ratios from Ordinal Logistic Regression",
    x = "Predictor",
    y = "Odds Ratio (95% CI)"
  ) + theme_minimal()

ggplot(exampledata, aes(SIMD)) + geom_bar(fill = "darkred") +
  labs(
    title = "SIMD Distribution",
    x = "SIMD Quintile",
    y = "count"
  ) +
  theme_minimal()

ggplot(exampledata, aes(TRAVEL)) + geom_bar(fill = "darkorange") +
  labs(
    title = "Travel Time Distribution",
    x = "Travel Time Category",
    y = "count"
  ) +
  theme_minimal()

ggplot(exampledata, aes(STAFFCOMS)) + geom_bar(fill = "coral3") +
  labs(
    title = "Reception Staff Communication Rating",
    x = "Communitcation Rating",
    y = "count"
  ) +
  theme_minimal()

ggplot(exampledata, aes(HEALTHSTAT)) + geom_bar(fill = "azure2") +
  labs(
    title = "Patient Health Status Distribution",
    x = "Health Status",
    y = "count"
  ) +
  theme_minimal()


# Ordered Logit Model -----------------------------------------------------

model1 <- polr(PATSAT ~ TRAVEL + APPTLOC + TIMELINESS + STAFFCOMS + EFFICACY + YRSWGP + COMPASSION + SAMEGP + CONNECT + MDTSTAFF + CLOSURE + AGE + NVISITS + EXPECTATION + GENDER + HEALTHSTAT + ETHNICITY + SIMD + RRCLASS, method = "logistic", data = exampledata)

summary(model1)

logLik(model1)

pR2(model1)


# Generate Odds Ratios Graph ----------------------------------------------

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


