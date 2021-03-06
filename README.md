# Project assignment from the "Getting and Cleaning Data" course
The course by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD
Johns Hopkins University, by Coursera
January 2015

##Objectives  
Project goal was to present skills in converting raw data into a tidy data set in a form of data frame with human readable variable names. 
Final dataset presents mean values of multiple mean and standard devaition variables collected from accelometers and gyroscopes, grouped by subjects and activities the subjects were performing.  
## Files
* README.md  
* CodeBook.md - variables description 
* run_analysis.R - R script converting row data into tidy data format saved as final_set.txt.  
* final_set.txt - space delimited data frame of dimension 180x81. Input: X_test.txt, y_test.txt, subject_test.txt (localized in ./test/ directory), X_train.txt, y_train.txt, subject_train.txt (localized in ./train/ directory), activity_labels.txt (localized in main directory)
output: final_set.txt - space delimited file. Varaibles in final_set.txt are described in CodeBook.md  

##Experiment description *(cited after authors)*
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

##Analysis pipeline conducded by script run_analysis.R
1. Load package "dplyr"
2. Chceck if all data files exist. Stop and return Error message if not.
3. Load data to data frames, add labels from the "features.txt" file
4. Add subject data and activity data as columns to test ant train datasets
5. Merge test and train data seta
6. Select only mean and std (standard deviation) variables
7. Change activity numbers to descriptive names
8. Create final subset: mean value of each variable grouped by subject and it's activity 
9. Save final subset as space delimited file final_set.txt

##Data source  
**http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones**
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. 
Smartlab - Non Linear Complex Systems Laboratory 
DITEN - UniversitA  degli Studi di Genova, Genoa I-16145, Italy. 
activityrecognition '@' smartlab.ws 
www.smartlab.ws 
##References  
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012