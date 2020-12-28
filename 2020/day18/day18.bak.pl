open STDIN,'day18.txt';

eval q($l=join'+',map{y/*/-/;s/\d+/bless([$&])/g;"($_)"}<>;useSover
load'+',$x=sub{bless[$_[0][0]+$_[1][0]]},'/',$x,'*',$y=sub{bless[$_
[0][0]*$_[1][0]]},'-',$y;print"PartS1:S",eval($l)->[0],"\nPartS2
:S",eval($l=~y|+|/|r)->[0],"\n";)=~s/\s//rg=~y/S/ /r;

=begin
                                        X
                                        X
                                        X
                                   XXXXXXXXXXX
                                        X
                                     XXXXXXX
                                 XXXXXXXXXXXXXX
                               XXXXXXXXXXXXXXXXXX
XXXXXXX                       XXXXXXXXXXXXXXXXXXXXX                       XXXXXXX
    XXXXXXXXXXXXXX            XXXXXXXXXXXXXXXXXXXXX            XXXXXXXXXXXXXX
              XXXXXXAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
                     XXXX      XXXXXXXXXXXXXXXXXXX      XXXX
                    XXXXXX        XXXXXXXXXXXXX        XXXXXX
                     XXXX                               XXXX
                                
=cut
