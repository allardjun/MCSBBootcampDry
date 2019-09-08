def lcs(str1, str2, m, n):
    '''Dynamic programming implementation of longest common subsequences 
    (LCS) problem, print the LCS as while as the length of the LCS 
    
    Parameters
    ----------
    str1 : str
        The first target string
    
    str2 : str
        The second target string

    m : int
        The length of str1
    
    n : int
        The length of str2
    '''

    opt =  [[0 for x in range(n+1)] for x in range(m+1)] 
    for i in range(m+1):
        for j in range(n+1):
            if i==0 or j==0:
                opt[i][j] = 0
            elif str1[i-1] == str2[j-1]:
                opt[i][j] = opt[i-1][j-1]+1
            else:
                opt[i][j] = max(opt[i-1][j], opt[i][j-1])
    
    length = opt[m][n]

    i, j, index = m, n, length
    lcs = [""]*(index)
    while i>0 and j>0:
        if str1[i-1] == str2[j-1]:
            lcs[index-1] = str1[i-1]
            i-=1
            j-=1
            index-=1
        elif opt[i-1][j] > opt[i][j-1]:
            i-=1
        else:
            j-=1
    
    print("The LCS is " + "".join(lcs))
    print("Length of the LCS is", length)