# DataCleaning Final
This package takes the _Human Activity Recognition Using Smartphones Dataset_[1] and calculated the average of the Mean and StdDev variables, outputtng to a CleanedSummary.txt file.

## Environment
It is expected that either the __UCI HAR Dataset__ or the __test__ and __train__ folders are available in the working directory. Execution of the script is performed by running `run_analysis()`.

## Cleaning Steps
The following steps are performed to clean up the variable names. We chose to use CamelCasing to ensure readability of the lengthy variables:
* Leading f/t characters are changed to FrequencyDomain/TimeDomain
* Dashes and Parenthesis are removed.
* Gravity and function names [mean/std] are capitalised.
* Frequency bands (in the form of **-N1,N2**) are simplified to the positive term (**N2**)
   * **Example:** `fBodyAcc-BandsEnergy()-17,24` would become `FrequencyDomainBodyAccBandsEnergy24`

#Data Dictionary
1. subjectid
2. activity
3. TimeDomainBodyAccMeanX
4. TimeDomainBodyAccMeanY
5. TimeDomainBodyAccMeanZ
6. TimeDomainBodyAccStdX
7. TimeDomainBodyAccStdY
8. TimeDomainBodyAccStdZ
9. TimeDomainGravityAccMeanX
10. TimeDomainGravityAccMeanY
11. TimeDomainGravityAccMeanZ
12. TimeDomainGravityAccStdX
13. TimeDomainGravityAccStdY
14. TimeDomainGravityAccStdZ
15. TimeDomainBodyAccJerkMeanX
16. TimeDomainBodyAccJerkMeanY
17. TimeDomainBodyAccJerkMeanZ
18. TimeDomainBodyAccJerkStdX
19. TimeDomainBodyAccJerkStdY
20. TimeDomainBodyAccJerkStdZ
21. TimeDomainBodyGyroMeanX
22. TimeDomainBodyGyroMeanY
23. TimeDomainBodyGyroMeanZ
24. TimeDomainBodyGyroStdX
25. TimeDomainBodyGyroStdY
26. TimeDomainBodyGyroStdZ
27. TimeDomainBodyGyroJerkMeanX
28. TimeDomainBodyGyroJerkMeanY
29. TimeDomainBodyGyroJerkMeanZ
30. TimeDomainBodyGyroJerkStdX
31. TimeDomainBodyGyroJerkStdY
32. TimeDomainBodyGyroJerkStdZ
33. TimeDomainBodyAccMagMean
34. TimeDomainBodyAccMagStd
35. TimeDomainGravityAccMagMean
36. TimeDomainGravityAccMagStd
37. TimeDomainBodyAccJerkMagMean
38. TimeDomainBodyAccJerkMagStd
39. TimeDomainBodyGyroMagMean
40. TimeDomainBodyGyroMagStd
41. TimeDomainBodyGyroJerkMagMean
42. TimeDomainBodyGyroJerkMagStd
43. FreqDomainBodyAccMeanX
44. FreqDomainBodyAccMeanY
45. FreqDomainBodyAccMeanZ
46. FreqDomainBodyAccStdX
47. FreqDomainBodyAccStdY
48. FreqDomainBodyAccStdZ
49. FreqDomainBodyAccMeanFreqX
50. FreqDomainBodyAccMeanFreqY
51. FreqDomainBodyAccMeanFreqZ
52. FreqDomainBodyAccJerkMeanX
53. FreqDomainBodyAccJerkMeanY
54. FreqDomainBodyAccJerkMeanZ
55. FreqDomainBodyAccJerkStdX
56. FreqDomainBodyAccJerkStdY
57. FreqDomainBodyAccJerkStdZ
58. FreqDomainBodyAccJerkMeanFreqX
59. FreqDomainBodyAccJerkMeanFreqY
60. FreqDomainBodyAccJerkMeanFreqZ
61. FreqDomainBodyGyroMeanX
62. FreqDomainBodyGyroMeanY
63. FreqDomainBodyGyroMeanZ
64. FreqDomainBodyGyroStdX
65. FreqDomainBodyGyroStdY
66. FreqDomainBodyGyroStdZ
67. FreqDomainBodyGyroMeanFreqX
68. FreqDomainBodyGyroMeanFreqY
69. FreqDomainBodyGyroMeanFreqZ
70. FreqDomainBodyAccMagMean
71. FreqDomainBodyAccMagStd
72. FreqDomainBodyAccMagMeanFreq
73. FreqDomainBodyBodyAccJerkMagMean
74. FreqDomainBodyBodyAccJerkMagStd
75. FreqDomainBodyBodyAccJerkMagMeanFreq
76. FreqDomainBodyBodyGyroMagMean
77. FreqDomainBodyBodyGyroMagStd
78. FreqDomainBodyBodyGyroMagMeanFreq
79. FreqDomainBodyBodyGyroJerkMagMean
80. FreqDomainBodyBodyGyroJerkMagStd
81. FreqDomainBodyBodyGyroJerkMagMeanFreq
82. TimeDomainBodyAccMeanGravityAngle
83. TimeDomainBodyAccJerkMeanGravityMeanAngle
84. TimeDomainBodyGyroMeanGravityMeanAngle
85. TimeDomainBodyGyroJerkMeanGravityMeanAngle
86. XGravityMeanAngle
87. YGravityMeanAngle
88. ZGravityMeanAngle

### Appendix
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.