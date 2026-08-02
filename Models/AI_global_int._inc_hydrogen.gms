Sets

t    'number of hours'                       /1*8760/
i    'number of countries'                  /1*57/
n    'number of years'                      /1*8/
j    'number of cost development scenarios' /1*3/
u    'index for print'                      /p1*p14/
m    'index for energy distribution'         /1*1/;

$call gdxxrw.exe Srd_AI_global_raw.xlsx par=radiation rng=sheet1!A1:LXY58 
*=== Now import data from GDX
Parameter radiation(i,t);
$gdxin Srd_AI_global_raw.gdx
$load radiation
$gdxin

$call gdxxrw.exe Wsp_AI_global_raw.xlsx par=speed rng=sheet1!A1:LXY58 
*=== Now import data from GDX
Parameter speed(i,t);
$gdxin Wsp_AI_global_raw.gdx
$load speed
$gdxin

$call gdxxrw.exe PUE_AI_global_raw.xlsx par=pu rng=sheet1!A1:LXY58 
*=== Now import data from GDX
Parameter pu(i,t);
$gdxin PUE_AI_global_raw.gdx
$load pu
$gdxin

$call gdxxrw.exe CI_AI_global_raw.xlsx par=ci rng=sheet1!A1:I58
*=== Now import data from GDX
Parameter ci(i,n);
$gdxin CI_AI_global_raw.gdx
$load ci
$gdxin

$call gdxxrw.exe LU_AI_global_raw.xlsx par=lu rng=sheet1!A1:I58
*=== Now import data from GDX
Parameter lu(i,n);
$gdxin LU_AI_global_raw.gdx
$load lu
$gdxin

$call gdxxrw.exe PI_AI_global_raw.xlsx par=pri rng=sheet1!A1:BF2
*=== Now import data from GDX
Parameter pri(m,i);
$gdxin PI_AI_global_raw.gdx
$load pri
$gdxin

$call gdxxrw.exe Solar_capital_cost.xlsx par=costsolar rng=sheet1!A1:I4
*=== Now import data from GDX
Parameter costsolar(j,n);
$gdxin Solar_capital_cost.gdx
$load costsolar
$gdxin

$call gdxxrw.exe Solar_operating_cost.xlsx par=opsolar rng=sheet1!A1:I4
*=== Now import data from GDX
Parameter opsolar(j,n);
$gdxin Solar_operating_cost.gdx
$load opsolar
$gdxin

$call gdxxrw.exe Wind_capital_cost.xlsx par=costwind rng=sheet1!A1:I4
*=== Now import data from GDX
Parameter costwind(j,n);
$gdxin Wind_capital_cost.gdx
$load costwind
$gdxin

$call gdxxrw.exe Wind_operating_cost.xlsx par=opwind rng=sheet1!A1:I4
*=== Now import data from GDX
Parameter opwind(j,n);
$gdxin Wind_operating_cost.gdx
$load opwind
$gdxin

$call gdxxrw.exe Cap_ratio.xlsx par=cpratio rng=sheet1!A1:BF2
*=== Now import data from GDX
Parameter cpratio(m,i);
$gdxin Cap_ratio.gdx
$load cpratio
$gdxin

$call gdxxrw.exe Heat_pump_capital_cost.xlsx par=costhp rng=sheet1!A1:I4
*=== Now import data from GDX
Parameter costhp(j,n);
$gdxin Heat_pump_capital_cost.gdx
$load costhp
$gdxin

$call gdxxrw.exe DAC_cost.xlsx par=costDAC rng=sheet1!A1:I4
*=== Now import data from GDX
Parameter costDAC(j,n);
$gdxin DAC_cost.gdx
$load costDAC
$gdxin

$call gdxxrw.exe LRF_carbon_AI_global_raw.xlsx par=lrfc rng=sheet1!A1:I2
*=== Now import data from GDX
Parameter lrfc(m,n);
$gdxin LRF_carbon_AI_global_raw.gdx
$load lrfc
$gdxin

$call gdxxrw.exe LIF_land_AI_global_raw.xlsx par=lifl rng=sheet1!A1:I2
*=== Now import data from GDX
Parameter lifl(m,n);
$gdxin LIF_land_AI_global_raw.gdx
$load lifl
$gdxin

$call gdxxrw.exe TC_AI_global_raw.xlsx par=trc rng=sheet1!A1:BF2
*=== Now import data from GDX
Parameter trc(m,i);
$gdxin TC_AI_global_raw.gdx
$load trc
$gdxin

Acronym zero

Parameter
NY /25/
cap /0.1662/
vcin /2/
vcout /25/
vr /11/
d /0.1/
bigM /1000000000/
epsilon /0.001/
dacmax /11400/
df /3.4/
daceff/1.72/
opstorage /0.01075/
hpmax /1000/
COP /3/
lf /0.48415/
lus /19/
luw /99/

elemax /1000/
fcmax /1000/

ICsolar 
sfoc
ICwind 
wfoc
ICdac
IChpump

ICele /758351.2826/
ICfc /207388.6826/
IChtank /483.906926/

effele /0.794967054/
efffc /0.602720119/
LHV /33.33/

sele /0.571/
sfc /0.571/
shtank /0.571/
shpump /0.571/

radin(t)
wspeed(t)
Pw(t)
PUE(t)
carbon
land
cr
gprice
crd
ldi
optransport

TCeq(j,n,i)
Paiceq(j,n,i)
Paiaeq(j,n,i)
Pgrideq(j,n,i)
Psreq(j,n,i)
Pwreq(j,n,i)
emmeq(j,n,i)
Pseq(j,n,i)
Pweq(j,n,i)
Ndeq(j,n,i)
Avemeq(j,n,i)
CCeq(j,n,i);

integer variable
nbattery
nhpump
ndac
nele
nfc
;

Positive variable

Asolar
ratedcapacity
Pratedwind

Psolar(t)
Pwind(t)
Pgrid(t)
Ptotal(t)
Pai(t)
Phpump(t)
Pheat(t)
Pdac(t)

Pele(t)
Pfc(t)
eleop(t)
fcop(t)
hpumpop(t)
h2p(t)
h2o(t)
captank
soh(t)

emission(t)
emissiontotal

Ctotal
Csolar
Cwind
Chpump
Cdac
Cele
Cfc
Chtank

capinterface

OPEXtotal
OPEXsolar
OPEXwind
OPEXgrid
OPEXdac
OPEXtransport
OPEXstorage

OPEXele
OPEXfc
OPEXtank

SALtotal 
SALsolar 
SALwind
SALhpump

SALele
SALfc
SALhtank
 
Pdemandtotal

Pit(t)

Pgridtotal

Psolartotal
Pwindtotal

Psolarutilized(t)
Pwindutilized(t)
emissionoriginal

Paictotal

Paiatotal

Pclean(t)
Pcleantotal

dacop(t)
carboncap(t)
carbontotal

AvEm
;

Variable
TC
;

Equations
eqPsolar(t)
eqPwind(t)
eqPtotal(t)

eqPsolarutilized(t)
eqPwindutilized(t)

eqPgridtotal
eqPsolartotal
eqPwindtotal

eqPbalance(t)

eqPheat(t)
eqPhpump(t)
eqhpumpop(t)
eqPhrelation(t)

eqh2p(t)
eqPele2(t)
eqeleop(t)

eqPfc(t)
eqPfc2(t)
eqfcop(t)
eqsoh(t)
eqsoh2(t)

eqPai(t)
eqPit(t)

eqCsolar
eqCwind
eqCdac
eqChpump

eqCele
eqCfc
eqChtank

eqCtotal

eqrated
eqOPEXsolar
eqOPEXwind
eqOPEXgrid
eqOPEXdac
eqOPEXtransport
eqOPEXstorage

eqOPEXele
eqOPEXfc
eqOPEXtank

eqOPEXtotal

eqSALtotal
eqSALhpump

eqSALele
eqSALfc
eqSALhtank

eqTC

eqPdemandtotal

eqcarboncaptured(t)
eqcarbontotal
eqdacmax(t)

eqemission(t)
eqemissiontotal

eqemissionoriginal

eqPaictotal
eqPaiatotal

eqPclean(t)
eqPcleantotal

eqRenewablePenetration

eqlandconstraint

eqAvEm
;

eqPsolar(t).. Psolar(t) =e= cap*Asolar*radin(t)/1000 ;
eqPwind(t).. Pwind(t) =e= Pratedwind*Pw(t) ;
eqPtotal(t).. Ptotal(t) =e= Psolarutilized(t)+Pwindutilized(t)+Pgrid(t)+Pfc(t);

eqPsolarutilized(t).. Psolarutilized(t) =l= Psolar(t) ; 
eqPwindutilized(t).. Pwindutilized(t) =l= Pwind(t) ; 

eqPgridtotal.. Pgridtotal =e= sum(t,Pgrid(t));
eqPsolartotal.. Psolartotal =e= sum(t,Psolarutilized(t)); 
eqPwindtotal.. Pwindtotal =e= sum(t,Pwindutilized(t));  

eqPbalance(t).. Ptotal(t) =e= Pai(t)+Pdac(t)+Phpump(t)+Pele(t) ;

eqPheat(t).. Pheat(t) =e= Phpump(t)*COP ;
eqPhpump(t).. Phpump(t) =l= hpumpop(t)*hpmax;
eqhpumpop(t).. hpumpop(t) =l= nhpump ;
eqPhrelation(t).. Pheat(t) =e= Pdac(t)*df ;

eqh2p(t).. h2p(t) =e= Pele(t)*effele/LHV ;
eqPele2(t).. Pele(t) =e= eleop(t)*elemax ;
eqeleop(t).. eleop(t) =l= nele ;

eqPfc(t).. Pfc(t) =e= h2o(t)*efffc*LHV ;
eqPfc2(t).. Pfc(t) =e= fcop(t)*fcmax ;
eqfcop(t).. fcop(t) =l= nfc ;
eqsoh(t).. soh(t) =e= (ord(t) = 1) * 0 + (ord(t) > 1) * (soh(t-1) + h2p(t-1) - h2o(t-1));
eqsoh2(t).. soh(t) =l= captank ;

eqPai(t).. Pai(t) =e= Pit(t)*PUE(t);
eqPit(t).. Pit(t) =e= 100*1000*lf ;

eqCsolar.. Csolar =e= Asolar*ICsolar ;
eqCwind.. Cwind =e= Pratedwind*ICwind ; 
eqCdac.. Cdac =e= carbontotal*NY*ICdac ;
eqChpump.. Chpump =e= nhpump*IChpump*2 ;

eqCele.. Cele =e= nele*ICele ;
eqCfc.. Cfc =e= nfc*ICfc ;
eqChtank.. Chtank =e= captank*Ichtank ;

eqCtotal.. Ctotal =e= Csolar+Cwind+Cdac+Chpump+Cele+Cfc+Chtank ;

eqrated.. ratedcapacity =e= sum(t,Psolar(t))/1000000/cr ;
eqOPEXsolar.. OPEXsolar =e= sfoc*ratedcapacity*NY ;
eqOPEXwind.. OPEXwind =e= wfoc*Pratedwind*NY ;
eqOPEXgrid.. OPEXgrid =e= sum(t,Pgrid(t))*gprice*NY ;
eqOPEXdac.. OPEXdac =e= 0.04*Cdac*NY ;
eqOPEXtransport.. OPEXtransport =e= optransport*carbontotal*NY ;
eqOPEXstorage.. OPEXstorage =e= opstorage*carbontotal*NY ;

eqOPEXele.. OPEXele =e= 0.03*Cele*NY ; 
eqOPEXfc.. OPEXfc =e= 0.025*Cfc*NY ;
eqOPEXtank.. OPEXtank =e= Chtank*NY*0.17 ;

eqOPEXtotal.. OPEXtotal =e= OPEXsolar+OPEXwind+OPEXgrid+OPEXdac+OPEXtransport+OPEXstorage+OPEXele+OPEXfc+OPEXtank ;

eqSALtotal.. SALtotal =e= (SALele+SALfc+SALhtank+SALhpump)/((1+d)**NY) ;
eqSALhpump.. SALhpump =e= nhpump*IChpump*shpump ;

eqSALele.. SALele =e= Cele*sele ;
eqSALfc.. SALfc =e= Cfc*sfc ;
eqSALhtank.. SALhtank =e= Chtank*shtank ;

eqTC.. TC =e= Ctotal+((OPEXtotal)/(NY*d)*(1-1/((1+d)**NY))-SALtotal) ;

eqPdemandtotal.. Pdemandtotal =e= sum(t,Ptotal(t)) ;

eqcarboncaptured(t).. carboncap(t) =e= Pdac(t)*daceff ;
eqcarbontotal.. carbontotal =e= sum(t,carboncap(t));
eqdacmax(t).. carboncap(t) =l= ndac*dacmax ;

eqemission(t).. emission(t) =e= Pgrid(t)*carbon;
eqemissiontotal.. emissiontotal =e= sum(t,emission(t))-carbontotal ;

eqemissionoriginal.. emissionoriginal =e= sum(t,Pai(t))*carbon ; 

eqPaictotal.. Paictotal =e= sum(t,Pai(t))/(d)*(1-1/((1+d)**NY)) ;
eqPaiatotal.. Paiatotal =e= sum(t,Pai(t)) ;

eqPclean(t).. Pclean(t) =e= Ptotal(t)-Pgrid(t) ; 
eqPcleantotal.. Pcleantotal =e= sum(t,Pclean(t)) ;

eqRenewablePenetration.. emissiontotal =e= crd*emissionoriginal ;

eqlandconstraint.. Pgridtotal*land+Psolartotal*lus+Pwindtotal*luw =l= Paiatotal*land*ldi ;

eqAvEm.. AvEm =e= emissionoriginal - emissiontotal ;

model AI_global_RP_50 / all /;

loop (j$(ord(j)= 2),

loop (n$(ord(n)= 8),

ICsolar = costsolar(j,n);
sfoc = opsolar(j,n);
ICwind = costwind(j,n);
wfoc = opwind(j,n);
ICdac = costDAC(j,n);
IChpump = costhp(j,n);

loop (i$(ord(i)<= 57),

radin(t) = radiation(i,t) ;
wspeed(t) = speed(i,t) ;
carbon = ci(i,n);
land = lu(i,n);
PUE(t) = pu(i,t);

Pw(t)$(wspeed(t) gt vcin and wspeed(t) le vr) = 1000*(wspeed(t)- vcin)/(vr-vcin);
Pw(t)$(wspeed(t) le vcin)=0;
Pw(t)$(wspeed(t) gt vr and wspeed(t) le vcout)= 1000;
Pw(t)$(wspeed(t) gt vcout)= 0;

loop (m$(ord(m)<= 1),
cr = cpratio(m,i);
gprice = pri(m,i);
crd = lrfc(m,n);
ldi = lifl(m,n);
optransport = trc(m,i); 
)

solve AI_global_RP_50 using mip minimizing TC ;

TCeq(j,n,i)=TC.l;
Paiceq(j,n,i)=Paictotal.l;
Paiaeq(j,n,i)=Paiatotal.l;
Pgrideq(j,n,i)=Pgridtotal.l;
Psreq(j,n,i)=ratedcapacity.l;
Pwreq(j,n,i)=Pratedwind.l;
emmeq(j,n,i)=nhpump.l;
Pseq(j,n,i)=Psolartotal.l;
Pweq(j,n,i)=Pwindtotal.l;
Ndeq(j,n,i)=ndac.l;
Avemeq(j,n,i)=AvEm.l;
CCeq(j,n,i)=carbontotal.l;

)
)
);

TCeq(j,n,i)$(NOT TCeq(j,n,i)) = zero;
Paiceq(j,n,i)$(NOT Paiceq(j,n,i)) = zero;
Paiaeq(j,n,i)$(NOT Paiaeq(j,n,i)) = zero;
Pgrideq(j,n,i)$(NOT Pgrideq(j,n,i)) = zero;
Psreq(j,n,i)$(NOT Psreq(j,n,i)) = zero;
Pwreq(j,n,i)$(NOT Pwreq(j,n,i)) = zero;
emmeq(j,n,i)$(NOT emmeq(j,n,i)) = zero;
Pseq(j,n,i)$(NOT Pseq(j,n,i)) = zero;
Pweq(j,n,i)$(NOT Pweq(j,n,i)) = zero;
Ndeq(j,n,i)$(NOT Ndeq(j,n,i)) = zero;
Avemeq(j,n,i)$(NOT Avemeq(j,n,i)) = zero;
CCeq(j,n,i)$(NOT CCeq(j,n,i)) = zero;

display TCeq;
display Paiceq;
display Paiaeq;
display Pgrideq;
display Psreq;
display Pwreq;
display emmeq;
display Pseq;
display Pweq;
display Ndeq;
display Avemeq;
display CCeq;


