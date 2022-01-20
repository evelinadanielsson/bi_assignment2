# This is a sample Python script.

# Press ⌃R to execute it or replace it with your code.
# Press Double ⇧ to search everywhere for classes, files, tool windows, actions, and settings.


# This Python 3 environment comes with many helpful analytics libraries installed
# It is defined by the kaggle/python Docker image: https://github.com/kaggle/docker-python
# For example, here's several helpful packages to load

import numpy as np  # linear algebra
import pandas as pd
import warnings

warnings.filterwarnings('ignore')

import matplotlib.pyplot as plt
import seaborn as sns

sns.set_style("darkgrid")

from sklearn.impute import KNNImputer
from sklearn.metrics import accuracy_score, confusion_matrix, r2_score
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split, GridSearchCV, cross_val_score, KFold
from sklearn.preprocessing import StandardScaler, LabelEncoder, PolynomialFeatures
from sklearn.linear_model import LinearRegression


def read_and_preprocess():
    df = pd.read_csv('garments_worker_productivity.csv')
    # print(df.info())

    # Checking values for department
    # print(df['department'].unique())
    # print(df['day'].unique())

    # Fixing values for department
    df['department'] = df['department'].apply(lambda x: 'finishing' if x == ('finishing ' or 'finishing') else 'sewing')
    # print(df['department'].unique())

    # Looking at the quarters
    # print(df.loc[df['quarter'] == 'Quarter1'])
    # print(df.loc[df['quarter'] == 'Quarter5'])

    # Checking means for missing values
    # print(df[df['wip'].isna()]['over_time'].mean())
    # print(df[df['wip'].notna()]['over_time'].mean())

    # print(df[df['wip'].isna()]['no_of_workers'].mean())
    # print(df[df['wip'].notna()]['no_of_workers'].mean())

    # creating column representing missing values
    missing_values = df['wip'].apply(lambda x: 1 if pd.isna(x) else 0)
    # adding column to df
    df['missing_wip'] = missing_values
    # print(df.info())

    # binning Quarter 4 and 5 together
    df['quarter'] = df['quarter'].apply(lambda x: 'Quarter4' if x == 'Quarter5' else x)
    # print(df['quarter'].unique())

    # Get one hot encoding of column 'departmnet'
    one_hot_department = pd.get_dummies(df['department'])
    # Drop column as it is now encoded
    df = df.drop('department', axis=1)
    # Join the encoded df
    df = df.join(one_hot_department)

    # Get one hot encoding of columns 'quarter'
    one_hot_quarters = pd.get_dummies(df['quarter'])
    # Drop column as it is now encoded
    df = df.drop('quarter', axis=1)
    # Join the encoded df
    df = df.join(one_hot_quarters)

    # Get one hot encoding of columns 'day'
    one_hot_day = pd.get_dummies(df['day'])
    # Drop column as it is now encoded
    df = df.drop('day', axis=1)
    # Join the encoded df
    df = df.join(one_hot_day)

    # Get one hot encoding of columns 'team'
    one_hot_team = pd.get_dummies(df['team'])
    # Drop column as it is now encoded
    df = df.drop('team', axis=1)
    # Join the encoded df
    df = df.join(one_hot_team)

    # Dropping date column
    df.drop('date', axis=1, inplace=True)

    target = 'actual_productivity'

    column_headers = df.columns.values

    # kNN imputation:
    imp = KNNImputer(n_neighbors=10)
    #df['wip'] = imp.fit_transform(df[['wip']]).ravel()
    imp = imp.fit(df)
    dataset_trans = imp.transform(df)

    # convert back to dataframe
    final_df = pd.DataFrame(dataset_trans, columns=column_headers)
    print(final_df)
    print(final_df.info())



# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    read_and_preprocess()

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
