
def funcWithSort(sir):
    #facem split pentru a separa cuvintele si a le pune in lista
    sir = sir.split(" ")
    #sortam sirul
    sir.sort()
    #returnam ultimul element
    return sir[len(sir)-1]

assert (funcWithSort('ana') == 'ana')
assert (funcWithSort('ana are mere rosii si galbene') == 'si')
assert (funcWithSort('Bellicose bumblebees buzz blissfully by Bavarian breezes below big bushy box branches.') == 'by')




































'''
# Function to find the partition position
def partition(array, low, high):
 
    # choose the rightmost element as pivot
    pivot = array[high]
 
    # pointer for greater element
    i = low - 1
 
    # traverse through all elements
    # compare each element with pivot
    for j in range(low, high):
        if array[j] <= pivot:
 
            # If element smaller than pivot is found
            # swap it with the greater element pointed by i
            i = i + 1
 
            # Swapping element at i with element at j
            (array[i], array[j]) = (array[j], array[i])
 
    # Swap the pivot element with the greater element specified by i
    (array[i + 1], array[high]) = (array[high], array[i + 1])
 
    # Return the position from where partition is done
    return i + 1
 
# function to perform quicksort
 
 
def quickSort(array, low, high):
    if low < high:
 
        # Find pivot element such that
        # element smaller than pivot are on the left
        # element greater than pivot are on the right
        pi = partition(array, low, high)
 
        # Recursive call on the left of pivot
        quickSort(array, low, pi - 1)
 
        # Recursive call on the right of pivot
        quickSort(array, pi + 1, high)
        
        
def fastestWay(sir):
    sir = sir.split(" ")
    quickSort(sir, 0, len(sir)-1)
    if (len(sir)>0):
        return sir[len(sir)-1]
    return None

assert (fastestWay('ana') == 'ana')
assert (fastestWay('ana are mere rosii si galbene') == 'si')
assert (fastestWay('Bellicose bumblebees buzz blissfully by Bavarian breezes below big bushy box branches.') == 'by')
'''