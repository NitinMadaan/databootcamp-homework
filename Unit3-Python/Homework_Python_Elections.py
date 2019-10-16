#!/usr/bin/env python
# coding: utf-8

# In[28]:


import os
import csv

election_csv = "/Users/nitinmadaan/Desktop/UOFT/Resources/election_data.csv"

TV=0
cc=0
Candidates = set()

c_list=[]


# In[29]:


with open(election_csv, 'r') as csvfile:
    csvreader = csv.reader(csvfile, delimiter=',')
    print(csvreader)
    csv_header = next(csvreader)
    print(f"CSV Header:{csv_header}")
    for row in csvreader:
        TV=TV+1
        Candidates.add(row[2])
        
    print("Election Results")
    print("-------------------------")
    print("Total Votes:" ,TV)
    print("-------------------------")
    
    c_list =list(Candidates)
    
i = 0


length = len(c_list)
vote_count = [0] * length 


with open(election_csv, newline='') as csvfile:
    csvreader = csv.reader(csvfile, delimiter=',')
    for row in csvreader: 
    
    
        for i in range(length):
            if row[2] == c_list[i]:
                vote_count[i] += 1


p = 0       
p_votes = []
      

for p in range(length):
    pv = round(vote_count[p] / TV * 100.00, 2)
    p_votes.append(pv)


max_votes = max(vote_count)

max_index = vote_count.index(max_votes)

election_winner = c_list[max_index]
         


# In[31]:


with open('election_results', 'w') as f:
    print("ELECTION RESULTS", file=f)
    print("----------------------------",file=f) 
    for (x, y, z) in zip(c_list, p_votes, vote_count):
        print("Name: ", x ,"; Percent: ", y, "; Total Votes: ", z ,file=f)
    print("---------------------------------------------------",file=f)
    print("Total votes: " + str(TV),file=f)
    print("---------------------------------------------------",file=f)
    print("Winner: " + str(election_winner),file=f)


# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:




