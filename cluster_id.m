function [C]=cluster_id(S,i)
C=10;
disp('********************************************************');
disp('For Node');disp(i);
if(S(i).xd>=0.0 && S(i).xd<=33.0000 && S(i).yd>=0.0 && S(i).yd<=33.000)
    d=sqrt( (16.5-(S(i).xd) )^2 + (16.5-(S(i).yd) )^2 );
    disp(' d is');disp(d);
    if (d<=16.5000)
    disp('C_id=1');
    C=1;
    else
        disp('node is not in range of cluster 1')
    end
end
if(S(i).xd>=0.000 && S(i).xd<=33.0000 && S(i).yd>=33.0001 && S(i).yd<=67.000)
    d=sqrt( (16.5-(S(i).xd) )^2 + (49.5-(S(i).yd) )^2 );
    disp('d is');disp(d);
    if (d<=16.5000)
    disp('C_id=2');
    C=2;
    else
        disp('node is not in range of cluster 2')
    end
end
if(S(i).xd>=0.0 && S(i).xd<=33.0000 && S(i).yd>=67.0001 && S(i).yd<=100.0000)
    d=sqrt( (16.5-(S(i).xd) )^2 + (83.5-(S(i).yd) )^2 );
    disp(' d is');disp(d);
    if (d<=16.5000)
    disp('C_id=3');
    C=3;
    else
        disp('node is not in range of cluster 3')
    end
end
if(S(i).xd>=33.0001 && S(i).xd<=67.0000 && S(i).yd>=0.0 && S(i).yd<=33.0000)
    d=sqrt( (49.5-(S(i).xd) )^2 + (16.5-(S(i).yd) )^2 );
    disp(' d is');disp(d);
    if (d<=16.5000)
    disp('C_id=4');
    C=4;
    else
        disp('node is not in range of cluster 4')
    end
end
if(S(i).xd>=33.0001 && S(i).xd<=67.000 && S(i).yd>=33.0001 && S(i).yd<=67.0000)
   d=sqrt( (49.5-(S(i).xd) )^2 + (49.5-(S(i).yd) )^2 );
    disp(' d is');disp(d);
    if (d<=16.5000)
    disp('C_id=5');
    C=5;
    else
        disp('node is not in range of cluster 5')
    end
end
if(S(i).xd>=33.0001 && S(i).xd<=67.000 && S(i).yd>=67.0001 && S(i).yd<=100.0000)
    d=sqrt( (49.5-(S(i).xd) )^2 + (83.5-(S(i).yd) )^2 );
    disp(' d is');disp(d);
    if (d<=16.5000)
    disp('C_id=6');
    C=6;
    else
        disp('node is not in range of cluster 6')
    end
end
if(S(i).xd>=67.0001 && S(i).xd<=100.000 && S(i).yd>=0.000 && S(i).yd<=33.000)
    d=sqrt( (83.5-(S(i).xd) )^2 + (16.5-(S(i).yd) )^2 );
    disp(' d is');disp(d);
    if (d<=16.5000)
    disp('C_id=7');
    C=7;
    else
        disp('node is not in range of cluster 7')
    end
end
if(S(i).xd>=67.0001 && S(i).xd<=100.0 && S(i).yd>=33.0001 && S(i).yd<=67.0000)
   d=sqrt( (83.5-(S(i).xd) )^2 + (49.5-(S(i).yd) )^2 );
    disp(' d is');disp(d);
    if (d<=16.5000)
    disp('C_id=8');
    C=8;
    else
        disp('node is not in range of cluster 8')
    end
end
if(S(i).xd>=67.0001 && S(i).xd<=100.0 && S(i).yd>=67.0001 && S(i).yd<=100.0)
    d=sqrt( (83.5-(S(i).xd) )^2 + (83.5-(S(i).yd) )^2 );
    disp(' d is');disp(d);
    if (d<=16.5000)
    disp('C_id=9');
    C=9;
    else
        disp('node is not in range of cluster 9')
    end
end
end