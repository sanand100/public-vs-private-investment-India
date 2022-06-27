library("readxl")
library("haven")
library(data.table)
setwd("~/Documents/Classes/Spring 2020/MIT 14.33/Homework/Data/States Data/sdp data files")
df <- read_excel("State_ wise _SDP-31.07.2015__REVISE.xlsx")
names(df)[names(df) == "State\\UT"] <- "state"

#df <- t(df)

# AP <- df[df$state == "Andhra Pradesh",]
# AP <- t(AP)
# AP <- data.table(AP)
# write.csv(AP, "./AP_SDP.csv")

an <- data.table(df[df$state == "Andaman & Nicobar Islands",])
an <- t(an)
write.csv(an, "./an_sdp.csv")

ap <- data.table(df[df$state == "Andhra Pradesh",])
ap <- ap[,-1]
ap <- t(ap)
write.csv(ap, "./ap_sdp.csv")


arunpra <- data.table(df[df$state == "Arunachal Pradesh",])
arunpra <- t(arunpra)
write.csv(arunpra, "./arunpra_sdp.csv")

assam <- data.table(df[df$state == "Assam",])
assam <- t(assam)
write.csv(assam, "./assam_sdp.csv")

bih <- data.table(df[df$state == "Bihar",])
bih <- t(bih)
write.csv(bih, "./bih_sdp.csv")

chan  <- data.table(df[df$state == "Chandigarh",])
chan <- t(chan)
write.csv(chan, "./chan_sdp.csv")

chhat  <- data.table(df[df$state == "Chhattisgarh",])
chhat <- t(chhat)
write.csv(chhat, "./chhat_sdp.csv")

##sdp does not exist for this union territory
# dadra <- data.table(df[df$state == "Dadra & Nagar Haveli",])
# dadra <- t(dadra)
# write.csv(dadra, "./dadra_sdp.csv") 

##sdp does not exist for this union territory
# dd <- data.table(df[df$state == "Daman & Diu",])
# dd <- t(dd)
# write.csv(dd, "./dd_sdp.csv")

goa  <- data.table(df[df$state == "Goa",])
goa <- t(goa)
write.csv(goa, "./goa_sdp.csv")

guj  <- data.table(df[df$state == "Gujarat",])
guj <- t(guj)
write.csv(guj, "./guj_sdp.csv")

har  <- data.table(df[df$state == "Haryana",])
har <- t(har)
write.csv(har, "./har_sdp.csv")

hp  <- data.table(df[df$state == "Himachal Pradesh",])
hp <- t(hp)
write.csv(hp, "./hp_sdp.csv")

jk  <- data.table(df[df$state == "Jammu & Kashmir",])
jk <- t(jk)
write.csv(jk, "./jk_sdp.csv")

jha  <- data.table(df[df$state == "Jharkhand",])
jha <- t(jha)
write.csv(jha, "./jha_sdp.csv")

kar  <- data.table(df[df$state == "Karnataka",])
kar <- t(kar)
write.csv(kar, "./kar_sdp.csv")

ker  <- data.table(df[df$state == "Kerala",])
ker <- t(ker)
write.csv(ker, "./ker_sdp.csv")

##No sdp for this union territory
# lak  <- data.table(df[df$state == "Lakshadweep",])
# lak <- t(lak)
# write.csv(lak, "./lak_sdp.csv")

mp  <- data.table(df[df$state == "Madhya Pradesh",])
mp <- t(mp)
write.csv(mp, "./mp_sdp.csv")

mah  <- data.table(df[df$state == "Maharashtra",])
mah <- t(mah)
write.csv(mah, "./mah_sdp.csv")

mani  <- data.table(df[df$state == "Manipur",])
mani <- t(mani)
write.csv(mani, "./mani_sdp.csv")

meg  <- data.table(df[df$state == "Meghalaya",])
meg <- t(meg)
write.csv(meg, "./meg_sdp.csv")

miz  <- data.table(df[df$state == "Mizoram",])
miz <- t(miz)
write.csv(miz, "./miz_sdp.csv")

nag  <- data.table(df[df$state == "Nagaland",])
nag <- t(nag)
write.csv(nag, "./nag_sdp.csv")

del  <- data.table(df[df$state == "Delhi",])
del <- t(del)
write.csv(del, "./del_sdp.csv")

odi  <- data.table(df[df$state == "Odisha",])
odi <- t(odi)
write.csv(odi, "./odi_sdp.csv")

pud  <- data.table(df[df$state == "Puducherry",])
pud <- t(pud)
write.csv(pud, "./pud_sdp.csv")

pun  <- data.table(df[df$state == "Punjab",])
pun <- t(pun)
write.csv(pun, "./pun_sdp.csv")

raj  <- data.table(df[df$state == "Rajasthan",])
raj <- t(raj)
write.csv(raj, "./raj_sdp.csv")

sik  <- data.table(df[df$state == "Sikkim",])
sik <- t(sik)
write.csv(sik, "./sik_sdp.csv")

tn  <- data.table(df[df$state == "Tamil Nadu",])
tn <- t(tn)
write.csv(tn, "./tn_sdp.csv")

tel  <- data.table(df[df$state == "Telangana",])
tel <- t(tel)
write.csv(tel, "./tel_sdp.csv")

tri  <- data.table(df[df$state == "Tripura",])
tri <- t(tri)
write.csv(tri, "./tri_sdp.csv")

up  <- data.table(df[df$state == "Uttar Pradesh",])
up <- t(up)
write.csv(up, "./up_sdp.csv")

utt  <- data.table(df[df$state == "Uttarakhand",])
utt <- t(utt)
write.csv(utt, "./utt_sdp.csv")

wb  <- data.table(df[df$state == "West Bengal",])
wb <- t(wb)
write.csv(wb, "./wb_sdp.csv")
