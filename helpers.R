
palk <- function(palk, liik="neto",tm.vaba=T, tm.maar=0.2, sm.maar=0.33, 
                     kp.maar=0.02, tk.maar.tootaja=T, tk.maar.tooandja=T){
    #maksumäärade paika seadmine
    if(tm.vaba==T){
        tm.vaba=154
    } else {tm.vaba=0}
    
    if(tk.maar.tootaja==T){
        tk.maar.tootaja=0.016
    } else {tk.maar.tootaja=0}
    
    if(tk.maar.tooandja==T){
        tk.maar.tooandja=0.008
    } else {tk.maar.tk.maar.tooandja=0}
   
    #arvutused kui on tegu brutopalgaga
    if (liik=="bruto") {
        #arvutused
        sm=round(palk*sm.maar,2)
        tk.tootaja=round(palk*tk.maar.tootaja,2)
        tk.tooandja=round(palk*tk.maar.tooandja, 2)
        kp=round(palk*kp.maar, 2)
        tm=round((palk-tm.vaba-tk.tootaja-kp)*tm.maar,2)
        if (tm<=0) {
            tm=0
        }
        #palk
        palk.neto=round(palk-tk.tootaja-kp-tm,2)
        #kulu eri osapooltele
        tooandja.kulu=round(palk+sm+tk.tooandja, 2)
        maksuametile.koik= round(sm+tk.tootaja+tk.tooandja+tm+kp, 2)
        #tulemite koondamine
        tulem=c(palk,palk.neto, tooandja.kulu, maksuametile.koik, tm, sm,kp,
                tk.tootaja, tk.tooandja)
    }
    #kui liik on neto
    if (liik=="neto") {
        #arvutused
        if(palk<=tm.vaba){
            tm.maar=0
        }
        palk.bruto=round((palk-tm.vaba*tm.maar)/
                             (1-tk.maar.tootaja-kp.maar-tm.maar+
                                  tk.maar.tootaja*tm.maar+kp.maar*tm.maar),2)
        sm=round(palk.bruto*sm.maar, 2)
        tk.tootaja=round(palk.bruto*tk.maar.tootaja, 2)
        tk.tooandja=round(palk.bruto*tk.maar.tooandja, 2)
        kp=round(palk.bruto*kp.maar, 2)
        tm=round((palk.bruto-tm.vaba-tk.tootaja-kp)*tm.maar, 2)
        #kulu eri osapooltele
        tooandja.kulu=palk+sm+tk.tooandja+tm+kp+tk.tootaja
        maksuametile.koik=sm+tk.tootaja+tk.tooandja+tm+kp
        #arvutame uuesti brutopalga, kuna eelmine on liiga täpne ning tagurpidi 
        #arvutades tekib komakohtades erinevus
        palk.bruto=palk+tm+kp+tk.tootaja
        tulem=c(palk.bruto, palk, tooandja.kulu, maksuametile.koik, tm, sm,kp,
                tk.tootaja, tk.tooandja)
    }
    #tulemite koondamine ja esitamine   
    tulem.names=c("Brutopalk", "Netopalk", "Tooandja kulu", 
                  "Maksuametile kantav summa", "Tulumaks",
                  "Sotsiaalmaks", "Kogumispension", "Tootuskindlustus (tootaja)",
                  "Tootuskindlustus (tooandja)")
    tulem.kokku=data.frame(tulem.names, tulem)
    names(tulem.kokku)=c(" ", "Summa (eurot)")
    
    print(tulem.kokku, row.names=F)
}
