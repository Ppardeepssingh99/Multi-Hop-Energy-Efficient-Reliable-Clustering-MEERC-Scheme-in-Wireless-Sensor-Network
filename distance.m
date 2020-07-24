function [d]=distance(S,sender,receiver)

          d=sqrt( (S(sender).xd-(S(receiver).xd) )^2 + (S(sender).yd-(S(receiver).yd) )^2 ); %Finding nodes in advertiser's range
           
end