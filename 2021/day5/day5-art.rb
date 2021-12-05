# Day 5: We had to avoid hydrothermal vents
$stdin=open 'day5.txt' # omit if reading from stdin

               S=->o{m                =Hash.
            new 0;$l.map           {|t,b|d=(R[
          b]<=>R[t])+I[          b].<=>(I[t]).
         i;o&&!(R[b]            ==R[t]||I[b
          ]==I[t])               &&next;;
          m[t]+=                 1;m[t+=
           +d]                    +=1\
       until t==b}            ;m.count{1<
        _2}};$l=               $<.map{|l
        |l.scan(               /(\d+),(
        \d+)/x).               map{0&&p
       Complex(_1,           _2)}};puts"\
    /part1: #{S[1]}\n      /part2: #{S[!1]}\
".tr('/ ','');BEGIN{R=->o{o.real};I=->o{o.imag}}
