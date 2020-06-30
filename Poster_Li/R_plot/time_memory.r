
pdf("time_memory.pdf")
# pdf("time_memory.pdf",width=15, height=10)

shape_dots <- c(0,1,2,3,4,5)
# options(scipen=999)
DB <- c("Biogrid", "HPRD", "Innate Exp", "Innate Man", "IntAct", "MINT")
program_col <- c("green", "blue", "purple", "red")

SPRINT_x <- c(3,3,3,3,3,3)
SPRINT_y <- c(6120/3600, 1257/3600, 3600/3600, 930/3600, 2672/3600, 952/3600)

PIPE_x <-c(18.9,18.9,18.9,18.9,18.9,18.9)
PIPE_y <-c(1150675200/3600, 435628800/3600, 872294400/3600, 230342400/3600, 616464000/3600, 372902400/3600)

# Martin_x <- c(6.1, 3.2, 5.7, 1.9, 3.5, 2.3)
Martin_x <- c(3.2,  1.9, 2.3, 6.1, 5.7, 3.5)
Martin_y <- c((584640+107222400)/3600, (26280+30888000)/3600, (101160+52557120)/3600, (1209600+672328903)/3600, (1209600+517723760)/3600, (1209600+348184068)/3600)

Ding_x <- c (79.5, 25.4, 41.1, 260, 257,220)
Ding_y <- c((236551+374360)/3600, (55532+285323)/3600, (120720+331865)/3600, (1209600+374360)/3600, (1209600+374360)/3600, (1209600+374360)/3600)

plot(SPRINT_y, SPRINT_x,   type="p", log="x",xaxt="n", ylab="Memory (GB)", xlab="Time (h)", las=1, ylim=range(1, 270), xlim=range(0.1:319633), cex = 2, pch = c(24), col="red", bg = "red")
aty <- axTicks(1)
# labels <- sapply(aty,function(i)
#   as.expression(bquote(10^ .(i))))
axis(1,at=c(0.1, 1, 10, 100, 1000, 10000, 100000), labels=c(as.expression(bquote("" ~ 0.1 ~ "")), as.expression(bquote("" ~ 1 ~ "")), as.expression(bquote("" ~ 10 ~ "")), as.expression(bquote("" ~ 10^2 ~ "")),  as.expression(bquote("" ~ 10^3 ~ "")),  as.expression(bquote("" ~ 10^4 ~ "")),  as.expression(bquote("" ~ 10^5 ~ ""))))

legend("topright", pch=c(22, 23, 21, 24), col=program_col, pt.bg=program_col, program)
# legend(x=146, y=1.5, lty=c(1,1,1,1), col=program_col, program,  bty="n")

points( PIPE_y, PIPE_x,pch= c(23), cex=2, col="blue", bg="blue")
points(Martin_y, Martin_x,  pch= c(22), cex=2, col="green", bg="green")
points(Ding_y, Ding_x,  pch= c(21), cex=2, col="purple", bg="purple")

#points(6.1, 14*24, pch = 22, bg = "grey", col="green")#Martin Biogrid training >14d

dev.off()