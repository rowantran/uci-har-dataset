# UCI HAR Data Cleanup


## Introduction
In accordance with the course project for JHU's online Getting and Cleaning Data course this script cleans data collected from UC Irvine's Human Activity Recognition database. The original data consists of the recordings of 30 subjects performing 6 different activities while using a Samsung Galaxy S smartphone.
The script merges the training and test data sets provided, and then extracts the mean and standard deviation for each of the measurements provided. It then labels each of the columns in the combined data set. Finally, it creates a second data set containing the mean of each of the variables for each combination of subject and activity. This final data set consists of 180 observations of 81 variables.


## Variables
Each variable apart from Activity.Name and Subject.ID takes the form of xxxxx.Mean or xxxxx.Std.Dev, where xxxxx represents a measurement. Each variable listed below Subject.ID would be substituted as xxxxx; i.e. T.Body.Acc would form T.Body.Acc.Mean and T.Body.Acc.Std.Dev. Some variables also have three variants of both mean and standard deviation, one for each axis of motion.

### Activity.Name
The activity being performed in the observation. It is a number from 1 to 6, each number representing the following activity:
* 1: Walking
* 2: Walking upstairs
* 3: Walking downstairs
* 4: Sitting
* 5: Standing
* 6: Laying

### Subject.ID
The subject being recorded in the observation. Each subject is represented by a number from 1 to 30.

### T.Body.Acc
Body motion component of acceleration. Represented in respect to time as a number between -1 and 1.

### T.Gravity.Acc
Gravity component of acceleration. Represented in the same manner as the above variable, along with all further variables.

### T.Body.AccJerk
Derived using linear acceleration of the body and angular velocity in respect to time. This variable was captured using the accelerometer.

### T.Body.Gyro
Acceleration captured using the gyrometer.

### T.Body.GyroJerk
Similar in meaning to T.Body.AccJerk, but using the gyrometer.

### T.Body.AccMag
Magnitude of the acceleration of the body. Captured using the Euclidean norm.

### T.Gravity.AccMag
Magnitude of the acceleration due to gravity.

### T.Body.AccJerkMag
Magnitude of the jerk of the body.

### T.Body.GyroMag
Magnitude of the acceleration captured with gyrometer.

### T.Body.GyroJerkMag
Magnitude of the jerk captured with the gyrometer.

### F.Body.Acc
Acceleration of the body with a Fast Fourier Transform applied.

### F.Body.AccJerk
Jerk of the body with FFT applied.

### F.Body.Gyro
Gyrometer acceleration with FFT.

### F.Body.AccJerkMag
Magnitude of the jerk with FFT.

### F.Body.GyroMag
Magnitude of the gyrometer acceleration with FFT.

### F.Body.GyroJerkMag
Magnitude of the gyrometer jerk with FFT applied.


## Data cleanup
No modifications to the data were made other than those in the run_analysis.R script. To run the script must be placed in the main directory of the data, i.e. "UCI HAR Dataset."

