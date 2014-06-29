for (i in 1:9)
  for(j in 1:9)
    for (k in 1:9)
      for (l in 1:9)
        for (m in 1:9)
          for (n in 1:9)
            for (o in 1:9)
              for (p in 1:9)
                for (q in 1:9)
                {
                  if (i+j+k==15 & l+m+n==15 & o+p+q==15 &
                    o+m+k == 15)
                    {print(i,j,k,"\n",l,m,n,"\n",o,p,q)
                     break;
                  }
                     
                }
