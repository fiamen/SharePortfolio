

library("stockPortfolio")

## Get symbols codes for ASX50 including index S&P ASX50

shares=read.csv("volume.csv")

## Download monthly return from Yahoo finance for the last 3 years

comb=NULL
for(i in 1:92){
returns=getReturns(shares$code[i],freq="month",get="all",start = "2012-01-01")
comb=cbind(comb,returns$R)

}
write.csv(comb,"returns.csv")


# Calculate the stock model
model=stockModel(comb,model="SIM",shortSelling = "n",index = 92)

# Detetemine the optimal portifolio based on the model
op=optimalPort(model)


