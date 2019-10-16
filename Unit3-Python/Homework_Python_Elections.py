#!/usr/bin/env python
# coding: utf-8

# In[42]:


import os
import csv
import decimal

budget_csv = "/Users/nitinmadaan/Desktop/UOFT/Resources/budget_data.csv"

change_list={}

TR=0
total_sum=0.00
row_amount = 0.00
p_ra=0.00
change=0.00
p_change = 0.00


with open(budget_csv, 'r') as csvfile:
    csvreader = csv.reader(csvfile, delimiter=',')
    print(csvreader)
    csv_header = next(csvreader)
    print(f"CSV Header:{csv_header}")
    for row in csvreader:
        TR=TR+1
        row_amount = float(row[1])
        ra = float(row_amount)
        total_sum = total_sum + row_amount
        if (p_ra != 0.00):
            change = ra - p_ra
            
        p_ra = ra
        
        c_change = change + p_change
        
        p_change = c_change
        
        change_list.update({row[0]:change})
        
       
    print("Financial Analysis")
    print("----------------------------") 
    print("Total Months:",TR)
    print("Total: $",total_sum)
    print("Total change: $",c_change/(TR-1))
    print("Greatest Increase in Profits:",max(zip(change_list.values(), change_list.keys())))
    print("Greatest Decrease in Profits:",min(zip(change_list.values(), change_list.keys()))) 


# In[44]:


with open('filename', 'w') as f:
    print("Financial Analysis", file=f)
    print("----------------------------",file=f) 
    print("Total Months:",TR,file=f)
    print("Total: $",total_sum,file=f)
    print("Total change: $",c_change/(TR-1),file=f)
    print("Greatest Increase in Profits:",max(zip(change_list.values(), change_list.keys())),file=f)
    print("Greatest Decrease in Profits:",min(zip(change_list.values(), change_list.keys())),file=f)


# In[22]:





# In[34]:





# In[ ]:




