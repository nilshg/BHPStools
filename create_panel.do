clear 
set more off

global pathbhps C:\Users\tew207\Desktop\PhD_Data\BHPS\Data
//global pathukhls C:\Users\tew207\Desktop\PhD_Data\US\

//bhps_ukhls *doby* *sex* *hwght* using indresp, bhpswaves(1/18) ukhlswaves(1/4) bhpsdir($pathbhps) ukhlsdir($pathukhls)

bhps_ukhls *doby* *fihhyr* *hgr2r* *sex* *hwght* using indresp, bhpswaves(1/18) bhpsdir($pathbhps)

gen year = wave + 1991
gen age = year - doby

drop if age > 64 | age < 20

// Only household heads
keep if hgr2r==1

// Only male 
keep if sex==1

sort hid

saveold "C:/Users/tew207/Desktop/BHPS_1_18.dta", replace
