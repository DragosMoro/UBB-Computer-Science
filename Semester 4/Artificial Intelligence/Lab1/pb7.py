import random

def quickselect(nums, k):
    if len(nums) == 1:
        return nums[0]
    pivot = random.choice(nums)
    lows = [x for x in nums if x < pivot]
    highs = [x for x in nums if x > pivot]
    pivots = [x for x in nums if x == pivot]
    #Daca k este mai mic sau egal cu lungimea listei highs, se reia procesul pe lista highs
    if k <= len(highs):
        return quickselect(highs, k)
    #Daca k este mai mic sau egal cu lungimea listei highs plus lungimea listei pivots, atunci pivotul este elementul k-lea și este returnat
    elif k <= len(highs) + len(pivots):
        return pivots[0]
    # Daca k este mai mare decât lungimea listei highs plus lungimea listei pivots, se reia procesul pe lista lows cu parametrul k ajustat corespunzător.
    else:
        return quickselect(lows, k - len(highs) - len(pivots))

assert(quickselect([7], 0)==7)
assert(quickselect([7,4,6,3,9,1], 2) == 7)
assert(quickselect([7,4,6,3,9,1,12,4,2,1,21,3,2,11,654,3,21,34,5,6,7,5,43,2,1,3,11,4,1,34,443,1,1,3,5455,4,3,2,1],3) == 443)

