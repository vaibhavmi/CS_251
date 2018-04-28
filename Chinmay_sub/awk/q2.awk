#!/usr/bin/gawk
BEGIN{
	i=0
	flag=0
	initime[0]=$1
	A[0]=$3
	split($5,x,":")
	B[0]=x[1]
	numpacketsA[0]=0
        numdatapacketsA[0]=0
        numbytesA[0]=0
        numretransA[0]=0
       	numpacketsB[0]=0
	numdatapacketsB[0]=0
        numbytesB[0]=0
	numretransB[0]=0
}
{
	split($5,y,":")
	for(j=0;j<=i;j++)
	{
		if( $3 == A[j] && y[1] == B[j] )
		{
			flag=1
			fintimeA[j]=$1
			ind=j
			break
		}
		else if( $3 == B[j] && y[1] == A[j] )
		{	
			flag=1
			fintimeB[j]=$1
			ind=j
			break	
		}
	}
	if( flag==0 )
	{
		i++
		A[i]=$3
		B[i]=y[1]
		initime[i]=$1
		numpacketsA[i]=0
		numdatapacketsA[i]=0
		numbytesA[i]=0
		numretransA[i]=0
		numpacketsB[i]=0
                numdatapacketsB[i]=0
                numbytesB[i]=0
                numretransB[i]=0
		ind=i
	}
	else
	{	
		flag=0		
	}
	if(A[ind] == $3)
	{
		if( $9 ~ /:/ )
		{
			numdatapacketsA[ind]++
			split($9,bytesA,":")
			numbytesA[ind]+=bytesA[2]-bytesA[1]
			check1[ind,numpacketsA[ind]]=bytesA[1]
			check2[ind,numpacketsA[ind]]=bytesA[2]
			for(k=0;k<numpacketsA[ind];k++)
			{
                        	if(bytesA[2]<=check2[ind,k] && bytesA[1]>=check1[ind,k])
				{
					numretransA[ind]+=bytesA[2]-bytesA[1]
				}
			}
		}
		numpacketsA[ind]++
	}
	else if(B[ind] == $3)
	{
                if( $9 ~ /:/ )
                {
                        numdatapacketsB[ind]++
                        split($9,bytesB,":")
                        numbytesB[ind]+=bytesB[2]-bytesB[1]
                	check3[ind,numpacketsB[ind]]=bytesB[1]
                        check4[ind,numpacketsB[ind]]=bytesB[2]
                        for(m=0;m<numpacketsB[ind];m++)
                        {
                                if(bytesB[2]<=check4[ind,m] && bytesB[1]>=check3[ind,m])
                                {
                                        numretransB[ind]+=bytesB[2]-bytesB[1]
                                }
                        }
		}
		numpacketsB[ind]++
	}		
}
END{
	for(l=1;l<=i;l++)
	{
		split(A[l],nameA,".");
		connA[l]=nameA[1]"."nameA[2]"."nameA[3]"."nameA[4]":"nameA[5]
		split(B[l],nameB,".");
        	connB[l]=nameB[1]"."nameB[2]"."nameB[3]"."nameB[4]":"nameB[5]
		split(initime[l],fir,":")
		split(fintimeA[l],secA,":")
		split(fintimeB[l],secB,":")
		timeA = (secA[1]-fir[1])*3600 + (secA[2]-fir[2])*60 + (secA[3]-fir[3])
		timeB = (secB[1]-fir[1])*3600 + (secB[2]-fir[2])*60 + (secB[3]-fir[3])
		xputA = (numbytesA[l] - numretransA[l])/timeA
		xputB = (numbytesB[l] - numretransB[l])/timeB
		print "Connection (A=" connA[l] " B=" connB[l] ")"
		printf ("A-->B #packets=%d, #datapackets=%d, #bytes=%d, #retrans=%d xput=%d bytes/sec\n",numpacketsA[l],numdatapacketsA[l],numbytesA[l],numretransA[l],xputA)
		printf ("B-->A #packets=%d, #datapackets=%d, #bytes=%d, #retrans=%d xput=%d bytes/sec\n",numpacketsB[l],numdatapacketsB[l],numbytesB[l],numretransB[l],xputB)
	}
}
