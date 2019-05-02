import json
list_holder = []

#Create Objects
"""
    {'tot_dist': x, 'tot_time': y,'pace': something, 'recommendation': z}
"""
#Do increasing weight
distance = 1
for _ in range(100):
    for pace in range(5,60):
        rec = 0
        #Check the levels or recommendation levels
        if pace < 6:
            rec = 7
            pass
        elif pace < 7:
            rec = 7
            pass
        elif pace < 8:
            rec = 6
            pass
        elif pace < 10:
            rec = 5
            pass
        elif pace < 15:
            rec = 4
            pass
        elif pace < 17:
            rec = 3
            pass
        elif pace < 20:
            rec = 2
            pass
        elif pace < 25:
            rec = 1
            pass
        elif pace < 60:
            rec = 0
        list_holder.append({'pace':pace, 'distance':distance, 'rec':rec})
distance = 2
for _ in range(100):

    for pace in range(5,60):
        rec = 0
        #Check the levels or recommendation levels
        if pace < 7:
            rec = 8
            pass
        elif pace < 8:
            rec = 7
            pass
        elif pace < 9:
            rec = 7
            pass
        elif pace < 10:
            rec = 7
            pass
        elif pace < 15:
            rec = 5
            pass
        elif pace < 20:
            rec = 3
            pass
        elif pace < 30:
            rec = 2
            pass
        elif pace < 45:
            rec = 1
            pass
        elif pace < 60:
            rec = 0
        list_holder.append({'pace':pace, 'distance':distance, 'rec':rec})
distance = 3
for _ in range(100):

    for pace in range(5,60):
        rec = 0
        #Check the levels or recommendation levels
        if pace < 9:
            rec = 8
            pass
        elif pace < 10:
            rec = 7
            pass
        elif pace < 12:
            rec = 6
            pass
        elif pace < 15:
            rec = 5
            pass
        elif pace < 20:
            rec = 4
            pass
        elif pace < 30:
            rec = 3
            pass
        elif pace < 40:
            rec = 2
            pass
        elif pace < 45:
            rec = 1
            pass
        elif pace < 60:
            rec = 0
        list_holder.append({'pace':pace, 'distance':distance, 'rec':rec})



with open('training_running_data.json', 'w') as outfile:
    json.dump(list_holder, outfile)
