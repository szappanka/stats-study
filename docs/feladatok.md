---
layout: default
title: Feladatok
---

# Feladatok

## Mathematical Statistics – Concept questions

**Instructions.** Answer briefly but precisely. These questions are designed to test conceptual understanding: correct interpretation, method choice, assumptions, diagnostics, and common mistakes.

---

### 1. (3 points)

**Situation.** A dataset contains the following variables: student ID number, exam score in points, satisfaction rating from 1 to 5, and room temperature measured in degrees Celsius.

**Task.** For each variable, identify the level of measurement or variable type. Then choose one variable for which taking an arithmetic mean would be questionable, and briefly explain why.

<details class="solution" markdown="1">

**Variable classification (változók osztályozása):**

| Variable | Level of measurement (mérési szint) | Why |
|---|---|---|
| Student ID number | Nominal (nominális) | Numbers are labels, not quantities |
| Exam score (points) | Ratio (arány) | Equal differences, true zero (0 points = nothing scored) |
| Satisfaction rating (1–5) | Ordinal (ordinális) | Order is meaningful, but distances between categories need not be equal |
| Room temperature (°C) | Interval (intervallum) | Equal differences, but zero is conventional (0°C ≠ no temperature) |

**Where the mean is questionable (mikor kérdéses az átlag):**
- **Student ID (azonosítószám):** taking the mean is meaningless — the numbers are arbitrary codes (címkék), not amounts
- **Satisfaction rating (elégedettségi értékelés):** also questionable — computing the mean assumes equal spacing between categories, which is not guaranteed for ordinal data

</details>

---

### 2. (3 points)

**Situation.** Suppose that the monthly electricity consumptions of households are modelled as independent observations from a normal distribution with unknown mean μ and unknown variance σ². A random sample of 80 households gives an average monthly electricity consumption of 236 kWh.

**Task.** Identify the relevant parameter of the distribution and the sample statistic in this situation. Explain why another random sample of 80 households would probably give a different average.

<details class="solution" markdown="1">

</details>

---

### 3. (4 points)

**Situation.** A report says: "A 95% confidence interval for the mean waiting time is [18.2, 21.6] minutes."

**Task.** Decide which interpretations are correct and correct the wrong ones.

(a) There is a 95% probability that this particular interval contains the true mean.

(b) If we repeated the same sampling procedure many times, about 95% of the intervals constructed in this way would contain the true mean.

(c) About 95% of individual waiting times are between 18.2 and 21.6 minutes.

(d) The interval gives plausible values for the unknown mean waiting time, not for every individual observation.

<details class="solution" markdown="1">

</details>

---

### 4. (3 points)

**Situation.** In a test of \\(H_0 : \mu = 100\\) against \\(H_1 : \mu \neq 100\\), the computed p-value is 0.032.

**Task.** What is the decision at significance level \\(\alpha = 0.05\\)? What is the decision at \\(\alpha = 0.01\\)? Explain why the sentence "the probability that \\(H_0\\) is true is 3.2%" is not a correct interpretation of the p-value.

<details class="solution" markdown="1">

</details>

---

### 5. (3 points)

**Situation.** Suppose a null hypothesis is rejected at significance level \\(\alpha = 0.05\\).

**Task.** What can we conclude about the decision at \\(\alpha = 0.10\\)? What can we conclude about the decision at \\(\alpha = 0.01\\)? Give a short explanation using the relation between the p-value and \\(\alpha\\).

<details class="solution" markdown="1">

</details>

---

### 6. (3 points)

**Situation.** A smoke alarm is treated as a hypothesis test. The null hypothesis is "there is no dangerous smoke", and the alarm rings when the null hypothesis is rejected.

**Task.** In this context, describe a Type I error and a Type II error. Which error becomes more likely if the alarm is made much less sensitive? Briefly justify your answer.

<details class="solution" markdown="1">

</details>

---

### 7. (3 points)

**Situation.** A researcher wants to use a one-sample t-confidence interval for an unknown mean when the variance is unknown.

**Task.** Explain why the Student t-distribution appears instead of the standard normal distribution. What role does the sample size play in this choice?

<details class="solution" markdown="1">

</details>

---

### 8. (3 points)

**Situation.** A researcher fits the simple linear regression model

$$Y_i = \beta_0 + \beta_1 x_i + \varepsilon_i$$

where \\(Y_i\\) is the final exam score and \\(x_i\\) is the number of hours studied. The estimated slope is positive. A residual-versus-fitted plot shows a clear curved pattern rather than a random cloud.

**Task.** Interpret \\(\beta_1\\) in words, explain what the curved residual pattern suggests, and decide whether the positive slope alone proves that studying more causes higher exam scores.

<details class="solution" markdown="1">

</details>

---

### 9. (3 points)

**Situation.** A daily time series records the number of visitors to a website. The plot shows a long-term upward trend and a clear weekly pattern.

**Task.** Is weak stationarity plausible for the original series? Name one transformation or modelling step that could make the series closer to stationary. What would a large positive autocorrelation at lag 7 suggest?

<details class="solution" markdown="1">

</details>

---

### 10. (2 points)

**Situation.** A company tests 20 different website variants, each at the 5% significance level, and then announces the one variant for which p = 0.04.

**Task.** What is the statistical problem with this reasoning? Name one way to make the analysis more reliable.

<details class="solution" markdown="1">

</details>

---

## Mathematical Statistics – Case-based concept exam

**Instructions.** Answer briefly but precisely. Each question is worth 3 points. The point is statistical understanding: interpretation, method choice, assumptions, diagnostics, and common mistakes.

**Case story – The laptop-sticker confidence census.** A research team investigates laptop stickers and exam confidence. The target population is all students attending review sessions before the exam, while the available dataset is 220 review-session attendances. Each row is one student-attendance. The spreadsheet contains laptop observation code, sticker theme, exam confidence from 1 to 5, number of stickers, a yes/no variable indicating whether had a statistics sticker, and the time series weekly average confidence rating. The team wants a responsible conclusion, not a headline that sounds impressive only because it has a decimal point.

---

### 1. (3 points)

**Situation.** In this dataset there are 96 rows. The variables are laptop observation code, sticker theme, exam confidence from 1 to 5, number of stickers, and the yes/no indicator for whether had a statistics sticker. A very enthusiastic intern wants to average every column because 'averages look scientific'.

**Task.** Identify the population, the sample, and the observational unit. Then classify the variables, and name one variable whose arithmetic mean would be meaningless or at least questionable.

<details class="solution" markdown="1">

</details>

---

### 2. (3 points)

**Situation.** A five-row pilot sample of number of stickers is: 16, 18, 19, 21, 43. A short report gives only the sample mean and announces that the typical case has been found.

**Task.** Compute the sample mean and the median. Which one is more robust in this small sample, and what is the exact warning against the naive report?

<details class="solution" markdown="1">

</details>

---

### 3. (3 points)

**Situation.** After giving out harmless 'I survived variance' stickers, a 95% confidence interval for the mean change in number of stickers is [0.5, 1.7]. The corresponding two-sided test of \\(H_0 : \mu = 0\\) gives p = 0.009. A headline draft says: 'We have measured the exact improvement of every individual case.'

**Task.** Decide at \\(\alpha = 0.05\\) and \\(\alpha = 0.01\\). Use the interval as a cross-check at the 5% level. Then correct the headline.

<details class="solution" markdown="1">

</details>

---

### 4. (3 points)

**Situation.** Another hypothesis test in the same project gives p = 0.004. A colleague says: 'So the null hypothesis is true with probability 99.6%, and false with probability 0.4%.'

**Task.** State the decisions at \\(\alpha = 0.10\\), \\(\alpha = 0.05\\), and \\(\alpha = 0.01\\). Then explain precisely why the colleague's p-value interpretation is wrong.

<details class="solution" markdown="1">

</details>

---

### 5. (3 points)

**Situation.** The distribution of number of stickers is strongly skewed. Two independent groups have sizes n1 = 31 and n2 = 32. A colleague proposes a standard two-sample t-test only because the sample sizes are not tiny and because the boxplot 'looks funny but friendly'.

**Task.** What should be checked before accepting this? Name one robust or nonparametric alternative and say what changes in interpretation.

<details class="solution" markdown="1">

</details>

---

### 6. (3 points)

**Situation.** A simple linear regression predicts exam confidence rating from number of laptop stickers. The fitted slope is -0.31, SE = 0.14, approximate 95% CI = [-0.58, -0.04], p = 0.026, and R-squared = 0.21. A poster draft claims that one more unit of number of laptop stickers magically causes the outcome to change.

**Task.** Interpret the slope. Decide at \\(\alpha = 0.05\\) and \\(\alpha = 0.01\\) whether the slope differs from 0. Does this regression alone prove a causal effect?

<details class="solution" markdown="1">

</details>

---

### 7. (3 points)

**Situation.** A follow-up multiple regression adds hours studied, time period, and one control variable to the previous model. R-squared changes from 0.24 to 0.34, adjusted R-squared is 0.2, the p-value for laptop stickers becomes 0.041, VIF for laptop stickers is 6.8, and the residual plot shows a curved pattern. A dashboard celebrates only the larger R-squared.

**Task.** What would you say about model improvement, the coefficient test at \\(\alpha = 0.05\\), multicollinearity, and the residual pattern? Why is the naive sentence 'higher R-squared means the model is automatically valid' wrong?

<details class="solution" markdown="1">

</details>

---

### 8. (3 points)

**Situation.** The time series weekly average confidence rating shows confidence trend near the exam. The sample autocorrelation at lag 7 is 0.39. The Ljung-Box test on fitted residuals gives p = 0.031, and a Dickey-Fuller-type unit-root test gives p = 0.04. Someone wants to use all three numbers as if they answered the same question.

**Task.** Interpret the lag-7 autocorrelation. What are the null hypotheses of the two tests, and what are the decisions at \\(\alpha = 0.05\\)? Why are these not the same diagnostic question?

<details class="solution" markdown="1">

</details>

---

### 9. (3 points)

**Situation.** A dashboard says method A is better overall. In easy cases, A has 76/95 successes and B has 41/45 successes. In hard cases, A has 10/45 successes and B has 25/85 successes. The dashboard ignores the easy/hard split because the overall bar chart looks cleaner.

**Task.** Compute the within-stratum success rates. What naive conclusion is dangerous, and what should be done before making a recommendation?

<details class="solution" markdown="1">

</details>

---

### 10. (3 points)

**Situation.** Two estimators of a target value θ are compared in a simulation where the true value is θ = 100. Estimator A has simulation mean 100.2 and standard error 8. Estimator B has simulation mean 96.5 and standard error 3.1. A naive analyst says: 'B is automatically better because its standard error is smaller.'

**Task.** Compute the approximate bias and MSE = bias² + variance for both estimators, using SE squared as the variance. Is the naive sentence correct as stated?

<details class="solution" markdown="1">

</details>
