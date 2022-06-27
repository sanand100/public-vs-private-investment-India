clear
log using "Goa Log.txt", replace
//use "/Users/shraddhaanand/Documents/Classes/Spring 2020/MIT 14.33/Homework/Data/all_cleaned_labeled.dta" if s == "AP"
use "/Users/shraddhaanand/Documents/Classes/Spring 2020/MIT 14.33/Homework/Data/States Data/goa_finalData.dta"

//deflating series
replace private = private/0.402567739 if year == 1996
replace private = private/0.428639117 if year == 1997
replace private = private/0.462973829 if year == 1998
replace private = private/0.477179697 if year == 1999
replace private = private/0.494572754 if year == 2000
replace private = private/0.510476315 if year == 2001
replace private = private/0.529444001 if year == 2002
replace private = private/0.549921826 if year == 2003
replace private = private/0.581407123 if year == 2004
replace private = private/0.614093269 if year == 2005
replace private = private/0.665682865 if year == 2006
replace private = private/0.711910667 if year == 2007
replace private = private/0.777363518 if year == 2008
replace private = private/0.83209275 if year == 2009
replace private = private/0.91967909 if year == 2010
replace private = private/1 if year == 2011
replace private = private/1.079343862 if year == 2012
replace private = private/1.146117514 if year == 2013
replace private = private/1.184303363 if year == 2014
replace private = private/1.211300602 if year == 2015
replace private = private/1.249144388 if year == 2016
replace private = private/1.297055381 if year == 2017
replace private = private/1.350385224 if year == 2018

replace public = public/0.402567739 if year == 1996
replace public = public/0.428639117 if year == 1997
replace public = public/0.462973829 if year == 1998
replace public = public/0.477179697 if year == 1999
replace public = public/0.494572754 if year == 2000
replace public = public/0.510476315 if year == 2001
replace public = public/0.529444001 if year == 2002
replace public = public/0.549921826 if year == 2003
replace public = public/0.581407123 if year == 2004
replace public = public/0.614093269 if year == 2005
replace public = public/0.665682865 if year == 2006
replace public = public/0.711910667 if year == 2007
replace public = public/0.777363518 if year == 2008
replace public = public/0.83209275 if year == 2009
replace public = public/0.91967909 if year == 2010
replace public = public/1 if year == 2011
replace public = public/1.079343862 if year == 2012
replace public = public/1.146117514 if year == 2013
replace public = public/1.184303363 if year == 2014
replace public = public/1.211300602 if year == 2015
replace public = public/1.249144388 if year == 2016
replace public = public/1.297055381 if year == 2017
replace public = public/1.350385224 if year == 2018


replace sdp = sdp/0.402567739 if year == 1996
replace sdp = sdp/0.428639117 if year == 1997
replace sdp = sdp/0.462973829 if year == 1998
replace sdp = sdp/0.477179697 if year == 1999
replace sdp = sdp/0.494572754 if year == 2000
replace sdp = sdp/0.510476315 if year == 2001
replace sdp = sdp/0.529444001 if year == 2002
replace sdp = sdp/0.549921826 if year == 2003
replace sdp = sdp/0.581407123 if year == 2004
replace sdp = sdp/0.614093269 if year == 2005
replace sdp = sdp/0.665682865 if year == 2006
replace sdp = sdp/0.711910667 if year == 2007
replace sdp = sdp/0.777363518 if year == 2008
replace sdp = sdp/0.83209275 if year == 2009
replace sdp = sdp/0.91967909 if year == 2010
replace sdp = sdp/1 if year == 2011
replace sdp = sdp/1.079343862 if year == 2012
replace sdp = sdp/1.146117514 if year == 2013
replace sdp = sdp/1.184303363 if year == 2014
replace sdp = sdp/1.211300602 if year == 2015
replace sdp = sdp/1.249144388 if year == 2016
replace sdp = sdp/1.297055381 if year == 2017
replace sdp = sdp/1.350385224 if year == 2018



//taking the log of the series to mitigate the outlying values
gen logpublic = log(public)
label var logpublic "log(public)"

gen logprivate = log(private)
label var logprivate "log(private)"

gen logsdp = log(sdp)

//creating graph of the series
label var qdate "Time"
tsset qdate
//graph twoway tsline logpublic logprivate logsdp, title("Private, Public, and SDP Series")
graph twoway tsline logpublic logprivate logsdp, title("Private investment, Public investment, and SDP: Goa")
cd "/Users/shraddhaanand/Documents/Classes/Spring 2020/MIT 14.33/Homework/Data/State Stata files"

//ANALYSIS

tsset qdate, quarterly
varsoc logprivate logpublic logsdp
//lag = 1

//check for stationarity
corrgram logprivate
//no
corrgram logpublic
//no 
corrgram logsdp
//no

corrgram d.logprivate
//yes
corrgram d.logpublic
//yes
corrgram d.logsdp
//yes

varsoc logprivate logpublic logsdp

//johansen test for cointegration
vecrank logprivate logpublic logsdp, trend(trend) lags(4)
//rank = 1 --> I(1) series so need to do VAR

vec logprivate logpublic logsdp, trend(none) lags(4)

irf create var1, step(20) set(myirf) replace
irf graph oirf, impulse(logpublic logprivate) response(logprivate logpublic) yline(0,lcolor(black)) xlabel(0(4)20) byopts(yrescale)


log close


