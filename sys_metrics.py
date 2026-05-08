import psutil

def sys_metrics():
    cpu_percentage = psutil.cpu_percent(interval=1)
    cpu_disk = psutil.disk_usage("/").percent
    cpu_memory = psutil.virtual_memory().percent
    threshold = 10
    if threshold > cpu_percentage :
        print("Health CPU")
    else:
        print("High CPU usage")
    return {
	"CPU %": cpu_percentage,
	"DISK %": cpu_disk,
 	"MEMORY %": cpu_memory,
	"ThresHold": threshold
	}

a =  sys_metrics()

print (a)
