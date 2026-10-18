# MATLAB-Assignment-2

# STA301 – Statistics and Probability: Applied MATLAB Problems for Software Engineering

MATLAB solutions to 15 applied questions, one for each of the first 15 lectures of the **STA301 Statistics and Probability Theory** course. Every question is set in a **software engineering** context (testing, performance, code quality, project management) so that each statistical topic is connected to real SE work.

| | |
|---|---|
| **Student** | Maida Amjad |
| **Registration No.** | FA23-BSE-128 |
| **Program** | BS Software Engineering |
| **University** | COMSATS University Islamabad, Vehari Campus |
| **Submitted to** | Sir Haider Ali |
| **Date** | 4 October 2026 |

## Questions and scripts

Replace each `Add link` with the YouTube video link for that question.

| Q | Lecture | Topic | Software engineering context | Script | Video |
|---|---------|-------|------------------------------|--------|-------|
| 1 | 1 | Variables, scales of measurement, error | Bug-tracker attributes, profiler accuracy | [`Q01_variables_and_measurement_error.m`](Q01_variables_and_measurement_error.m) | Add link |
| 2 | 2 | Sampling methods | Auditing bug reports across modules | [`Q02_sampling_strategies.m`](Q02_sampling_strategies.m) | Add link |
| 3 | 3 | Discrete frequency distribution | Defects per module | [`Q03_discrete_frequency_distribution.m`](Q03_discrete_frequency_distribution.m) | Add link |
| 4 | 4 | Continuous frequency distribution, Sturges' rule | API response times | [`Q04_continuous_frequency_distribution.m`](Q04_continuous_frequency_distribution.m) | Add link |
| 5 | 5 | Cumulative frequency and ogive | CI/CD build durations | [`Q05_ogive_and_cumulative_frequency.m`](Q05_ogive_and_cumulative_frequency.m) | Add link |
| 6 | 6 | Stem-and-leaf display, mode | Function sizes (lines of code) | [`Q06_stem_leaf_and_mode.m`](Q06_stem_leaf_and_mode.m) | Add link |
| 7 | 7 | Mean, weighted mean, median | Test coverage, bug-fix times | [`Q07_mean_weighted_mean_median.m`](Q07_mean_weighted_mean_median.m) | Add link |
| 8 | 8 | Grouped median, quantiles, open-ended class | Bug resolution times | [`Q08_grouped_median_quantiles.m`](Q08_grouped_median_quantiles.m) | Add link |
| 9 | 9 | Geometric and harmonic mean | Release speed-ups, server throughput | [`Q09_geometric_harmonic_means.m`](Q09_geometric_harmonic_means.m) | Add link |
| 10 | 10 | Range, quartile deviation | Latency of two cloud regions | [`Q10_measures_of_dispersion.m`](Q10_measures_of_dispersion.m) | Add link |
| 11 | 11 | Standard deviation, coefficient of variation | Consistency of two algorithms | [`Q11_standard_deviation_and_cv.m`](Q11_standard_deviation_and_cv.m) | Add link |
| 12 | 12 | Chebychev, empirical rule, five-number summary | API latency SLAs | [`Q12_chebychev_empirical_five_number.m`](Q12_chebychev_empirical_five_number.m) | Add link |
| 13 | 13 | Box plot, Pearson's skewness | Oversized commits | [`Q13_boxplot_and_pearson_skewness.m`](Q13_boxplot_and_pearson_skewness.m) | Add link |
| 14 | 14 | Moments, Sheppard's corrections, Bowley's skewness, kurtosis | Cyclomatic complexity | [`Q14_moments_skewness_kurtosis.m`](Q14_moments_skewness_kurtosis.m) | Add link |
| 15 | 15 | Regression, standard error of estimate, correlation | Effort estimation from KLOC | [`Q15_regression_and_correlation.m`](Q15_regression_and_correlation.m) | Add link |

## How to run

1. Clone or download this repository.
   ```bash
   git clone <your-repository-url>
   ```
2. Open MATLAB and set the repository folder as the **Current Folder**.
3. Open any `Qxx_*.m` file and press **Run**, or type its name in the Command Window without the `.m`, for example:
   ```matlab
   Q08_grouped_median_quantiles
   ```
4. Results are printed in the Command Window, and figures open in separate windows where the question asks for a chart.

Each script is self-contained: it declares its own data, so no other files are needed.

## Requirements

- MATLAB R2016b or later.
- No toolbox is needed. Box plots and quantiles are written by hand so the scripts run on base MATLAB.
- `Q01` to `Q05` use the `table` function, which is available in MATLAB but not in older GNU Octave versions.

## Conventions used

- **Descriptive statistics divide by n**, as in the course handouts, so variance and standard deviation are computed with divisor `n`. MATLAB's default `std` divides by `n - 1`, and `Q11` prints both for comparison.
- **Quartiles** for ungrouped data use the position `p * (n + 1)` with linear interpolation, matching the handout method.
- **Grouped quantiles** use `l + (h/f)(p*n - C)` or, equivalently, interpolation on the ogive.
- `Q02` calls `rng(1)`, so the random samples are reproducible.

## Repository contents

```
.
├── Q01_variables_and_measurement_error.m
├── Q02_sampling_strategies.m
├── ...
├── Q15_regression_and_correlation.m
└── README.md
```

The written solutions (problem, formulas, working, interpretation) are in the accompanying Word document, `STA301_Applied_Solutions_Lectures_1-15.docx`.

## Author

**Maida Amjad**, BS Software Engineering, COMSATS University Islamabad, Vehari Campus.
