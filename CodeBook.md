
Variable description:

train_data_x: Contains a table from the file train/X_Train.txt.
train_data_y: Contains a table from the file train/Y_Train.txt.
subject_train: Table, each row contains one column only with the number of the subject.
test_data_x: Same as train_data_x, but the data comes from test/X_test.txt
test_data_y: Same as train_data_y, but the data comes from test/Y_test.txt
subject_text: Same as subject_train, but for test data.
activity_labels: table that relates the name of the activity with its number on train_data_y and test_data_y
features: names of the columns for train_data_x and test_data_x.

total_data: The result of the merge between train_data_x, test_data_x, train_data_y, test_data_y, subject_test and subject_train.

