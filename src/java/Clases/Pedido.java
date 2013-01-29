package Clases;

import org.apache.struts.action.ActionForm;

/**
 *
 * @author smaf
 */
public class Pedido extends ActionForm {

    /*Usuario que realiza el pedido */
    private String usuario;
    /*Cascos */
    private Boolean cascoSeguridad;
    private String f1;
    private String c1;
    private Boolean cascoMotorizado;
    private String f2;
    private String c2;
    /*Lentes */
    private Boolean lentesSeguridad;
    private String f3;
    private String c3;
    private Boolean lentesCopa;
    private String f4;
    private String c4;
    /*Respiradores */
    private Boolean respiradorCaraCompleta;
    private String f5;
    private String c5;
    private Boolean respiradorMedioRostro;
    private String f6;
    private String c6;
    /*Mascarillas */
    private Boolean mascarilla;
    private String f7;
    private String c7;
    /*Gorro */
    private Boolean gorro;
    private String f8;
    private String c8;
    /*Careta para soldar acido */
    private Boolean caretaSoldar;
    private String f9;
    private String c9;
    /*Sombreros y gorras */
    private Boolean sombreroTipoPava;
    private String f10;
    private String c10;
    private Boolean gorraGrisLogo;
    private String f11;
    private String c11;
    private Boolean gorraAzul;
    private String f12;
    private String c12;
    /*Botas */
    private Boolean botasDielectricas;
    private String f13;
    private String c13;
    private Boolean botasPHierro;
    private String f14;
    private String c14;
    private Boolean botasCanaLarga;
    private String f15;
    private String c15;
    private Boolean botasTipoMilitar;
    private String f16;
    private String c16;
    private Boolean botasVaquetaCanaLarga;
    private String f17;
    private String c17;
    private Boolean botasMontanera;
    private String f18;
    private String c18;
    private Boolean botasCueroVulcanizTactica;
    private String f19;
    private String c19;
    /*Guantes */
    private Boolean guantesCarnaza;
    private String f20;
    private String c20;
    private Boolean guantesCarnazaSoldador;
    private String f21;
    private String c21;
    private Boolean guantesAntiAcido18;
    private String f22;
    private String c22;
    private Boolean guantesLatex;
    private String f23;
    private String c23;
    private Boolean guantesKevlar14;
    private String f24;
    private String c24;
    private Boolean guantesKevlar20;
    private String f25;
    private String c25;
    private Boolean guantesVaqueta;
    private String f26;
    private String c26;
    private Boolean guantesNitrilo;
    private String f27;
    private String c27;
    private Boolean guantesMotorizado;
    private String f28;
    private String c28;
    private Boolean guantesAntideslizantes;
    private String f29;
    private String c29;
    private Boolean guantesNeopreno;
    private String f30;
    private String c30;
    /*Filtros */
    private Boolean filtroVaporOrganico;
    private String f31;
    private String c31;
    private Boolean filtroCloro;
    private String f32;
    private String c32;
    private Boolean filtroMercurio;
    private String f33;
    private String c33;
    /*Anti caidas */
    private Boolean arnesSeguridad;
    private String f34;
    private String c34;
    /*Delantales */
    private Boolean delantalCocinero;
    private String f35;
    private String c35;
    private Boolean delantalSoldadura;
    private String f36;
    private String c36;
    private Boolean delantalNeopreno;
    private String f37;
    private String c37;
    private Boolean delantalPVC;
    private String f38;
    private String c38;
    /*Calzado */
    private Boolean calzadoAntideslizante;
    private String f39;
    private String c39;
    /*Pantalon bombero */
    private Boolean pantalonBomberoRescateAzul;
    private String f40;
    private String c40;
    private Boolean pantalonTipoBombero;
    private String f41;
    private String c41;
    /*Chaqueta bombero */
    private Boolean chaquetaBombero;
    private String f42;
    private String c42;
    /*Uniforme bombero */
    private Boolean uniformeTipoMilitar;
    private String f43;
    private String c43;
    /*Botas bombero */
    private Boolean botasCombateIncendio;
    private String f44;
    private String c44;
    /*Guantes bombero */
    private Boolean guantesCombateIncendio;
    private String f45;
    private String c45;
    /*Impermeable */
    private Boolean impermeableMotorizado;
    private String f46;
    private String c46;
    /*Bragas */
    private Boolean bragaGrisDobleCostura;
    private String f47;
    private String c47;
    private Boolean bragaNegraDobleCostura;
    private String f48;
    private String c48;
    /*Batas */
    private Boolean bataAzul;
    private String f49;
    private String c49;
    private Boolean bataGris;
    private String f50;
    private String c50;
    private Boolean bataNegra;
    private String f51;
    private String c51;
    private Boolean bataBlanca;
    private String f52;
    private String c52;
    /*Chemisses */
    private Boolean chemisseAzul;
    private String f53;
    private String c53;
    private Boolean chemisseBeige;
    private String f54;
    private String c54;
    private Boolean chemisseVerde;
    private String f55;
    private String c55;
    private Boolean chemisseBlanca;
    private String f56;
    private String c56;
    private Boolean chemisseGris;
    private String f57;
    private String c57;
    /*Blazer */
    private Boolean blazerAzul;
    private String f58;
    private String c58;
    /*Blue jeans */
    private Boolean blueJeans;
    private String f59;
    private String c59;
    /*Camisas */
    private Boolean camisaBlanca;
    private String f60;
    private String c60;
    private Boolean camisaAzul;
    private String f61;
    private String c61;
    private Boolean camisaBeige;
    private String f62;
    private String c62;
    /*Paraguas */
    private Boolean paraguas;
    private String f63;
    private String c63;
    /*Pantalla con atalaje */
    private Boolean pantallaAtalaje;
    private String f64;
    private String c64;
    /*Materiales de admnistrativo */
    private Boolean maletin;
    private String f65;
    private String c65;
    private Boolean camisaVestir;
    private String f66;
    private String c66;
    private Boolean pantalonVestir;
    private String f67;
    private String c67;
    private Boolean zapatosVestir;
    private String f68;
    private String c68;
    private Boolean chaquetaVestir;
    private String f69;
    private String c69;

    public String getF30() {
        return f30;
    }

    public void setF30(String f30) {
        this.f30 = f30;
    }

    public String getC30() {
        return c30;
    }

    public void setC30(String c30) {
        this.c30 = c30;
    }

    public String getF31() {
        return f31;
    }

    public void setF31(String f31) {
        this.f31 = f31;
    }

    public String getC31() {
        return c31;
    }

    public void setC31(String c31) {
        this.c31 = c31;
    }

    public String getF32() {
        return f32;
    }

    public void setF32(String f32) {
        this.f32 = f32;
    }

    public String getC32() {
        return c32;
    }

    public void setC32(String c32) {
        this.c32 = c32;
    }

    public String getF33() {
        return f33;
    }

    public void setF33(String f33) {
        this.f33 = f33;
    }

    public String getC33() {
        return c33;
    }

    public void setC33(String c33) {
        this.c33 = c33;
    }

    public String getF34() {
        return f34;
    }

    public void setF34(String f34) {
        this.f34 = f34;
    }

    public String getC34() {
        return c34;
    }

    public void setC34(String c34) {
        this.c34 = c34;
    }

    public String getF35() {
        return f35;
    }

    public void setF35(String f35) {
        this.f35 = f35;
    }

    public String getC35() {
        return c35;
    }

    public void setC35(String c35) {
        this.c35 = c35;
    }

    public String getF36() {
        return f36;
    }

    public void setF36(String f36) {
        this.f36 = f36;
    }

    public String getC36() {
        return c36;
    }

    public void setC36(String c36) {
        this.c36 = c36;
    }

    public String getF37() {
        return f37;
    }

    public void setF37(String f37) {
        this.f37 = f37;
    }

    public String getC37() {
        return c37;
    }

    public void setC37(String c37) {
        this.c37 = c37;
    }

    public String getF38() {
        return f38;
    }

    public void setF38(String f38) {
        this.f38 = f38;
    }

    public String getC38() {
        return c38;
    }

    public void setC38(String c38) {
        this.c38 = c38;
    }

    public String getF39() {
        return f39;
    }

    public void setF39(String f39) {
        this.f39 = f39;
    }

    public String getC39() {
        return c39;
    }

    public void setC39(String c39) {
        this.c39 = c39;
    }

    public String getF40() {
        return f40;
    }

    public void setF40(String f40) {
        this.f40 = f40;
    }

    public String getC40() {
        return c40;
    }

    public void setC40(String c40) {
        this.c40 = c40;
    }

    public String getF41() {
        return f41;
    }

    public void setF41(String f41) {
        this.f41 = f41;
    }

    public String getC41() {
        return c41;
    }

    public void setC41(String c41) {
        this.c41 = c41;
    }

    public String getF42() {
        return f42;
    }

    public void setF42(String f42) {
        this.f42 = f42;
    }

    public String getC42() {
        return c42;
    }

    public void setC42(String c42) {
        this.c42 = c42;
    }

    public String getF43() {
        return f43;
    }

    public void setF43(String f43) {
        this.f43 = f43;
    }

    public String getC43() {
        return c43;
    }

    public void setC43(String c43) {
        this.c43 = c43;
    }

    public String getF44() {
        return f44;
    }

    public void setF44(String f44) {
        this.f44 = f44;
    }

    public String getC44() {
        return c44;
    }

    public void setC44(String c44) {
        this.c44 = c44;
    }

    public String getF45() {
        return f45;
    }

    public void setF45(String f45) {
        this.f45 = f45;
    }

    public String getC45() {
        return c45;
    }

    public void setC45(String c45) {
        this.c45 = c45;
    }

    public String getF46() {
        return f46;
    }

    public void setF46(String f46) {
        this.f46 = f46;
    }

    public String getC46() {
        return c46;
    }

    public void setC46(String c46) {
        this.c46 = c46;
    }

    public String getF47() {
        return f47;
    }

    public void setF47(String f47) {
        this.f47 = f47;
    }

    public String getC47() {
        return c47;
    }

    public void setC47(String c47) {
        this.c47 = c47;
    }

    public String getF48() {
        return f48;
    }

    public void setF48(String f48) {
        this.f48 = f48;
    }

    public String getC48() {
        return c48;
    }

    public void setC48(String c48) {
        this.c48 = c48;
    }

    public String getF49() {
        return f49;
    }

    public void setF49(String f49) {
        this.f49 = f49;
    }

    public String getC49() {
        return c49;
    }

    public void setC49(String c49) {
        this.c49 = c49;
    }

    public String getF50() {
        return f50;
    }

    public void setF50(String f50) {
        this.f50 = f50;
    }

    public String getC50() {
        return c50;
    }

    public void setC50(String c50) {
        this.c50 = c50;
    }

    public String getF51() {
        return f51;
    }

    public void setF51(String f51) {
        this.f51 = f51;
    }

    public String getC51() {
        return c51;
    }

    public void setC51(String c51) {
        this.c51 = c51;
    }

    public String getF52() {
        return f52;
    }

    public void setF52(String f52) {
        this.f52 = f52;
    }

    public String getC52() {
        return c52;
    }

    public void setC52(String c52) {
        this.c52 = c52;
    }

    public String getF53() {
        return f53;
    }

    public void setF53(String f53) {
        this.f53 = f53;
    }

    public String getC53() {
        return c53;
    }

    public void setC53(String c53) {
        this.c53 = c53;
    }

    public String getF54() {
        return f54;
    }

    public void setF54(String f54) {
        this.f54 = f54;
    }

    public String getC54() {
        return c54;
    }

    public void setC54(String c54) {
        this.c54 = c54;
    }

    public String getF55() {
        return f55;
    }

    public void setF55(String f55) {
        this.f55 = f55;
    }

    public String getC55() {
        return c55;
    }

    public void setC55(String c55) {
        this.c55 = c55;
    }

    public String getF56() {
        return f56;
    }

    public void setF56(String f56) {
        this.f56 = f56;
    }

    public String getC56() {
        return c56;
    }

    public void setC56(String c56) {
        this.c56 = c56;
    }

    public String getF57() {
        return f57;
    }

    public void setF57(String f57) {
        this.f57 = f57;
    }

    public String getC57() {
        return c57;
    }

    public void setC57(String c57) {
        this.c57 = c57;
    }

    public String getF58() {
        return f58;
    }

    public void setF58(String f58) {
        this.f58 = f58;
    }

    public String getC58() {
        return c58;
    }

    public void setC58(String c58) {
        this.c58 = c58;
    }

    public String getF59() {
        return f59;
    }

    public void setF59(String f59) {
        this.f59 = f59;
    }

    public String getC59() {
        return c59;
    }

    public void setC59(String c59) {
        this.c59 = c59;
    }

    public String getF60() {
        return f60;
    }

    public void setF60(String f60) {
        this.f60 = f60;
    }

    public String getC60() {
        return c60;
    }

    public void setC60(String c60) {
        this.c60 = c60;
    }

    public String getF61() {
        return f61;
    }

    public void setF61(String f61) {
        this.f61 = f61;
    }

    public String getC61() {
        return c61;
    }

    public void setC61(String c61) {
        this.c61 = c61;
    }

    public String getF62() {
        return f62;
    }

    public void setF62(String f62) {
        this.f62 = f62;
    }

    public String getC62() {
        return c62;
    }

    public void setC62(String c62) {
        this.c62 = c62;
    }

    public String getF63() {
        return f63;
    }

    public void setF63(String f63) {
        this.f63 = f63;
    }

    public String getC63() {
        return c63;
    }

    public void setC63(String c63) {
        this.c63 = c63;
    }

    public String getF64() {
        return f64;
    }

    public void setF64(String f64) {
        this.f64 = f64;
    }

    public String getC64() {
        return c64;
    }

    public void setC64(String c64) {
        this.c64 = c64;
    }

    public String getF65() {
        return f65;
    }

    public void setF65(String f65) {
        this.f65 = f65;
    }

    public String getC65() {
        return c65;
    }

    public void setC65(String c65) {
        this.c65 = c65;
    }

    public String getF66() {
        return f66;
    }

    public void setF66(String f66) {
        this.f66 = f66;
    }

    public String getC66() {
        return c66;
    }

    public void setC66(String c66) {
        this.c66 = c66;
    }

    public String getF67() {
        return f67;
    }

    public void setF67(String f67) {
        this.f67 = f67;
    }

    public String getC67() {
        return c67;
    }

    public void setC67(String c67) {
        this.c67 = c67;
    }

    public String getF68() {
        return f68;
    }

    public void setF68(String f68) {
        this.f68 = f68;
    }

    public String getC68() {
        return c68;
    }

    public void setC68(String c68) {
        this.c68 = c68;
    }

    public String getF69() {
        return f69;
    }

    public void setF69(String f69) {
        this.f69 = f69;
    }

    public String getC69() {
        return c69;
    }

    public void setC69(String c69) {
        this.c69 = c69;
    }

    public String getF2() {
        return f2;
    }

    public void setF2(String f2) {
        this.f2 = f2;
    }

    public String getC2() {
        return c2;
    }

    public void setC2(String c2) {
        this.c2 = c2;
    }

    public String getF3() {
        return f3;
    }

    public void setF3(String f3) {
        this.f3 = f3;
    }

    public String getC3() {
        return c3;
    }

    public void setC3(String c3) {
        this.c3 = c3;
    }

    public String getF4() {
        return f4;
    }

    public void setF4(String f4) {
        this.f4 = f4;
    }

    public String getC4() {
        return c4;
    }

    public void setC4(String c4) {
        this.c4 = c4;
    }

    public String getF5() {
        return f5;
    }

    public void setF5(String f5) {
        this.f5 = f5;
    }

    public String getC5() {
        return c5;
    }

    public void setC5(String c5) {
        this.c5 = c5;
    }

    public String getF6() {
        return f6;
    }

    public void setF6(String f6) {
        this.f6 = f6;
    }

    public String getC6() {
        return c6;
    }

    public void setC6(String c6) {
        this.c6 = c6;
    }

    public String getF7() {
        return f7;
    }

    public void setF7(String f7) {
        this.f7 = f7;
    }

    public String getC7() {
        return c7;
    }

    public void setC7(String c7) {
        this.c7 = c7;
    }

    public String getF8() {
        return f8;
    }

    public void setF8(String f8) {
        this.f8 = f8;
    }

    public String getC8() {
        return c8;
    }

    public void setC8(String c8) {
        this.c8 = c8;
    }

    public String getF9() {
        return f9;
    }

    public void setF9(String f9) {
        this.f9 = f9;
    }

    public String getC9() {
        return c9;
    }

    public void setC9(String c9) {
        this.c9 = c9;
    }

    public String getF10() {
        return f10;
    }

    public void setF10(String f10) {
        this.f10 = f10;
    }

    public String getC10() {
        return c10;
    }

    public void setC10(String c10) {
        this.c10 = c10;
    }

    public String getF11() {
        return f11;
    }

    public void setF11(String f11) {
        this.f11 = f11;
    }

    public String getC11() {
        return c11;
    }

    public void setC11(String c11) {
        this.c11 = c11;
    }

    public String getF12() {
        return f12;
    }

    public void setF12(String f12) {
        this.f12 = f12;
    }

    public String getC12() {
        return c12;
    }

    public void setC12(String c12) {
        this.c12 = c12;
    }

    public String getF13() {
        return f13;
    }

    public void setF13(String f13) {
        this.f13 = f13;
    }

    public String getC13() {
        return c13;
    }

    public void setC13(String c13) {
        this.c13 = c13;
    }

    public String getF14() {
        return f14;
    }

    public void setF14(String f14) {
        this.f14 = f14;
    }

    public String getC14() {
        return c14;
    }

    public void setC14(String c14) {
        this.c14 = c14;
    }

    public String getF15() {
        return f15;
    }

    public void setF15(String f15) {
        this.f15 = f15;
    }

    public String getC15() {
        return c15;
    }

    public void setC15(String c15) {
        this.c15 = c15;
    }

    public String getF16() {
        return f16;
    }

    public void setF16(String f16) {
        this.f16 = f16;
    }

    public String getC16() {
        return c16;
    }

    public void setC16(String c16) {
        this.c16 = c16;
    }

    public String getF17() {
        return f17;
    }

    public void setF17(String f17) {
        this.f17 = f17;
    }

    public String getC17() {
        return c17;
    }

    public void setC17(String c17) {
        this.c17 = c17;
    }

    public String getF18() {
        return f18;
    }

    public void setF18(String f18) {
        this.f18 = f18;
    }

    public String getC18() {
        return c18;
    }

    public void setC18(String c18) {
        this.c18 = c18;
    }

    public String getF19() {
        return f19;
    }

    public void setF19(String f19) {
        this.f19 = f19;
    }

    public String getC19() {
        return c19;
    }

    public void setC19(String c19) {
        this.c19 = c19;
    }

    public String getF20() {
        return f20;
    }

    public void setF20(String f20) {
        this.f20 = f20;
    }

    public String getC20() {
        return c20;
    }

    public void setC20(String c20) {
        this.c20 = c20;
    }

    public String getF21() {
        return f21;
    }

    public void setF21(String f21) {
        this.f21 = f21;
    }

    public String getC21() {
        return c21;
    }

    public void setC21(String c21) {
        this.c21 = c21;
    }

    public String getF22() {
        return f22;
    }

    public void setF22(String f22) {
        this.f22 = f22;
    }

    public String getC22() {
        return c22;
    }

    public void setC22(String c22) {
        this.c22 = c22;
    }

    public String getF23() {
        return f23;
    }

    public void setF23(String f23) {
        this.f23 = f23;
    }

    public String getC23() {
        return c23;
    }

    public void setC23(String c23) {
        this.c23 = c23;
    }

    public String getF24() {
        return f24;
    }

    public void setF24(String f24) {
        this.f24 = f24;
    }

    public String getC24() {
        return c24;
    }

    public void setC24(String c24) {
        this.c24 = c24;
    }

    public String getF25() {
        return f25;
    }

    public void setF25(String f25) {
        this.f25 = f25;
    }

    public String getC25() {
        return c25;
    }

    public void setC25(String c25) {
        this.c25 = c25;
    }

    public String getF26() {
        return f26;
    }

    public void setF26(String f26) {
        this.f26 = f26;
    }

    public String getC26() {
        return c26;
    }

    public void setC26(String c26) {
        this.c26 = c26;
    }

    public String getF27() {
        return f27;
    }

    public void setF27(String f27) {
        this.f27 = f27;
    }

    public String getC27() {
        return c27;
    }

    public void setC27(String c27) {
        this.c27 = c27;
    }

    public String getF28() {
        return f28;
    }

    public void setF28(String f28) {
        this.f28 = f28;
    }

    public String getC28() {
        return c28;
    }

    public void setC28(String c28) {
        this.c28 = c28;
    }

    public String getF29() {
        return f29;
    }

    public void setF29(String f29) {
        this.f29 = f29;
    }

    public String getC29() {
        return c29;
    }

    public void setC29(String c29) {
        this.c29 = c29;
    }

    public String getF1() {
        return f1;
    }

    public void setF1(String f1) {
        this.f1 = f1;
    }

    public String getC1() {
        return c1;
    }

    public void setC1(String c1) {
        this.c1 = c1;
    }

    public Boolean getChaquetaVestir() {
        return chaquetaVestir;
    }

    public void setChaquetaVestir(Boolean chaquetaVestir) {
        this.chaquetaVestir = chaquetaVestir;
    }

    public Boolean getZapatosVestir() {
        return zapatosVestir;
    }

    public void setZapatosVestir(Boolean zapatosVestir) {
        this.zapatosVestir = zapatosVestir;
    }

    public Boolean getPantalonVestir() {
        return pantalonVestir;
    }

    public void setPantalonVestir(Boolean pantalonVestir) {
        this.pantalonVestir = pantalonVestir;
    }

    public Boolean getCamisaVestir() {
        return camisaVestir;
    }

    public void setCamisaVestir(Boolean camisaVestir) {
        this.camisaVestir = camisaVestir;
    }

    public Boolean getMaletin() {
        return maletin;
    }

    public void setMaletin(Boolean maletin) {
        this.maletin = maletin;
    }

    public Boolean getPantallaAtalaje() {
        return pantallaAtalaje;
    }

    public void setPantallaAtalaje(Boolean pantallaAtalaje) {
        this.pantallaAtalaje = pantallaAtalaje;
    }

    public Boolean getParaguas() {
        return paraguas;
    }

    public void setParaguas(Boolean paraguas) {
        this.paraguas = paraguas;
    }

    public Boolean getCamisaBeige() {
        return camisaBeige;
    }

    public void setCamisaBeige(Boolean camisaBeige) {
        this.camisaBeige = camisaBeige;
    }

    public Boolean getCamisaAzul() {
        return camisaAzul;
    }

    public void setCamisaAzul(Boolean camisaAzul) {
        this.camisaAzul = camisaAzul;
    }

    public Boolean getCamisaBlanca() {
        return camisaBlanca;
    }

    public void setCamisaBlanca(Boolean camisaBlanca) {
        this.camisaBlanca = camisaBlanca;
    }

    public Boolean getBlueJeans() {
        return blueJeans;
    }

    public void setBlueJeans(Boolean blueJeans) {
        this.blueJeans = blueJeans;
    }

    public Boolean getBlazerAzul() {
        return blazerAzul;
    }

    public void setBlazerAzul(Boolean blazerAzul) {
        this.blazerAzul = blazerAzul;
    }

    public Boolean getChemisseAzul() {
        return chemisseAzul;
    }

    public void setChemisseAzul(Boolean chemisseAzul) {
        this.chemisseAzul = chemisseAzul;
    }

    public Boolean getChemisseBeige() {
        return chemisseBeige;
    }

    public void setChemisseBeige(Boolean chemisseBeige) {
        this.chemisseBeige = chemisseBeige;
    }

    public Boolean getChemisseVerde() {
        return chemisseVerde;
    }

    public void setChemisseVerde(Boolean chemisseVerde) {
        this.chemisseVerde = chemisseVerde;
    }

    public Boolean getChemisseBlanca() {
        return chemisseBlanca;
    }

    public void setChemisseBlanca(Boolean chemisseBlanca) {
        this.chemisseBlanca = chemisseBlanca;
    }

    public Boolean getChemisseGris() {
        return chemisseGris;
    }

    public void setChemisseGris(Boolean chemisseGris) {
        this.chemisseGris = chemisseGris;
    }

    public Boolean getBataBlanca() {
        return bataBlanca;
    }

    public void setBataBlanca(Boolean bataBlanca) {
        this.bataBlanca = bataBlanca;
    }

    public Boolean getBataAzul() {
        return bataAzul;
    }

    public void setBataAzul(Boolean bataAzul) {
        this.bataAzul = bataAzul;
    }

    public Boolean getBataGris() {
        return bataGris;
    }

    public void setBataGris(Boolean bataGris) {
        this.bataGris = bataGris;
    }

    public Boolean getBataNegra() {
        return bataNegra;
    }

    public void setBataNegra(Boolean bataNegra) {
        this.bataNegra = bataNegra;
    }

    public Boolean getBragaGrisDobleCostura() {
        return bragaGrisDobleCostura;
    }

    public void setBragaGrisDobleCostura(Boolean bragaGrisDobleCostura) {
        this.bragaGrisDobleCostura = bragaGrisDobleCostura;
    }

    public Boolean getBragaNegraDobleCostura() {
        return bragaNegraDobleCostura;
    }

    public void setBragaNegraDobleCostura(Boolean bragaNegraDobleCostura) {
        this.bragaNegraDobleCostura = bragaNegraDobleCostura;
    }

    public Boolean getImpermeableMotorizado() {
        return impermeableMotorizado;
    }

    public void setImpermeableMotorizado(Boolean impermeableMotorizado) {
        this.impermeableMotorizado = impermeableMotorizado;
    }

    public Boolean getGuantesCombateIncendio() {
        return guantesCombateIncendio;
    }

    public void setGuantesCombateIncendio(Boolean guantesCombateIncendio) {
        this.guantesCombateIncendio = guantesCombateIncendio;
    }

    public Boolean getBotasCombateIncendio() {
        return botasCombateIncendio;
    }

    public void setBotasCombateIncendio(Boolean botasCombateIncendio) {
        this.botasCombateIncendio = botasCombateIncendio;
    }

    public Boolean getUniformeTipoMilitar() {
        return uniformeTipoMilitar;
    }

    public void setUniformeTipoMilitar(Boolean uniformeTipoMilitar) {
        this.uniformeTipoMilitar = uniformeTipoMilitar;
    }

    public Boolean getPantalonBomberoRescateAzul() {
        return pantalonBomberoRescateAzul;
    }

    public void setPantalonBomberoRescateAzul(Boolean pantalonBomberoRescateAzul) {
        this.pantalonBomberoRescateAzul = pantalonBomberoRescateAzul;
    }

    public Boolean getPantalonTipoBombero() {
        return pantalonTipoBombero;
    }

    public void setPantalonTipoBombero(Boolean pantalonTipoBombero) {
        this.pantalonTipoBombero = pantalonTipoBombero;
    }

    public Boolean getChaquetaBombero() {
        return chaquetaBombero;
    }

    public void setChaquetaBombero(Boolean chaquetaBombero) {
        this.chaquetaBombero = chaquetaBombero;
    }

    public Boolean getCalzadoAntideslizante() {
        return calzadoAntideslizante;
    }

    public void setCalzadoAntideslizante(Boolean calzadoAntideslizante) {
        this.calzadoAntideslizante = calzadoAntideslizante;
    }

    public Boolean getDelantalSoldadura() {
        return delantalSoldadura;
    }

    public void setDelantalSoldadura(Boolean delantalSoldadura) {
        this.delantalSoldadura = delantalSoldadura;
    }

    public Boolean getDelantalNeopreno() {
        return delantalNeopreno;
    }

    public void setDelantalNeopreno(Boolean delantalNeopreno) {
        this.delantalNeopreno = delantalNeopreno;
    }

    public Boolean getDelantalPVC() {
        return delantalPVC;
    }

    public void setDelantalPVC(Boolean delantalPVC) {
        this.delantalPVC = delantalPVC;
    }

    public Boolean getDelantalCocinero() {
        return delantalCocinero;
    }

    public void setDelantalCocinero(Boolean delantalCocinero) {
        this.delantalCocinero = delantalCocinero;
    }

    public Boolean getArnesSeguridad() {
        return arnesSeguridad;
    }

    public void setArnesSeguridad(Boolean arnesSeguridad) {
        this.arnesSeguridad = arnesSeguridad;
    }

    public Boolean getFiltroVaporOrganico() {
        return filtroVaporOrganico;
    }

    public void setFiltroVaporOrganico(Boolean filtroVaporOrganico) {
        this.filtroVaporOrganico = filtroVaporOrganico;
    }

    public Boolean getFiltroCloro() {
        return filtroCloro;
    }

    public void setFiltroCloro(Boolean filtroCloro) {
        this.filtroCloro = filtroCloro;
    }

    public Boolean getFiltroMercurio() {
        return filtroMercurio;
    }

    public void setFiltroMercurio(Boolean filtroMercurio) {
        this.filtroMercurio = filtroMercurio;
    }

    public Boolean getGuantesCarnaza() {
        return guantesCarnaza;
    }

    public void setGuantesCarnaza(Boolean guantesCarnaza) {
        this.guantesCarnaza = guantesCarnaza;
    }

    public Boolean getGuantesCarnazaSoldador() {
        return guantesCarnazaSoldador;
    }

    public void setGuantesCarnazaSoldador(Boolean guantesCarnazaSoldador) {
        this.guantesCarnazaSoldador = guantesCarnazaSoldador;
    }

    public Boolean getGuantesAntiAcido18() {
        return guantesAntiAcido18;
    }

    public void setGuantesAntiAcido18(Boolean guantesAntiAcido18) {
        this.guantesAntiAcido18 = guantesAntiAcido18;
    }

    public Boolean getGuantesLatex() {
        return guantesLatex;
    }

    public void setGuantesLatex(Boolean guantesLatex) {
        this.guantesLatex = guantesLatex;
    }

    public Boolean getGuantesKevlar14() {
        return guantesKevlar14;
    }

    public void setGuantesKevlar14(Boolean guantesKevlar14) {
        this.guantesKevlar14 = guantesKevlar14;
    }

    public Boolean getGuantesKevlar20() {
        return guantesKevlar20;
    }

    public void setGuantesKevlar20(Boolean guantesKevlar20) {
        this.guantesKevlar20 = guantesKevlar20;
    }

    public Boolean getGuantesVaqueta() {
        return guantesVaqueta;
    }

    public void setGuantesVaqueta(Boolean guantesVaqueta) {
        this.guantesVaqueta = guantesVaqueta;
    }

    public Boolean getGuantesNitrilo() {
        return guantesNitrilo;
    }

    public void setGuantesNitrilo(Boolean guantesNitrilo) {
        this.guantesNitrilo = guantesNitrilo;
    }

    public Boolean getGuantesMotorizado() {
        return guantesMotorizado;
    }

    public void setGuantesMotorizado(Boolean guantesMotorizado) {
        this.guantesMotorizado = guantesMotorizado;
    }

    public Boolean getGuantesAntideslizantes() {
        return guantesAntideslizantes;
    }

    public void setGuantesAntideslizantes(Boolean guantesAntideslizantes) {
        this.guantesAntideslizantes = guantesAntideslizantes;
    }

    public Boolean getGuantesNeopreno() {
        return guantesNeopreno;
    }

    public void setGuantesNeopreno(Boolean guantesNeopreno) {
        this.guantesNeopreno = guantesNeopreno;
    }

    public Boolean getBotasTipoMilitar() {
        return botasTipoMilitar;
    }

    public void setBotasTipoMilitar(Boolean botasTipoMilitar) {
        this.botasTipoMilitar = botasTipoMilitar;
    }

    public Boolean getBotasVaquetaCanaLarga() {
        return botasVaquetaCanaLarga;
    }

    public void setBotasVaquetaCanaLarga(Boolean botasVaquetaCanaLarga) {
        this.botasVaquetaCanaLarga = botasVaquetaCanaLarga;
    }

    public Boolean getBotasMontanera() {
        return botasMontanera;
    }

    public void setBotasMontanera(Boolean botasMontanera) {
        this.botasMontanera = botasMontanera;
    }

    public Boolean getBotasCueroVulcanizTactica() {
        return botasCueroVulcanizTactica;
    }

    public void setBotasCueroVulcanizTactica(Boolean botasCueroVulcanizTactica) {
        this.botasCueroVulcanizTactica = botasCueroVulcanizTactica;
    }

    public Boolean getSombreroTipoPava() {
        return sombreroTipoPava;
    }

    public void setSombreroTipoPava(Boolean sombreroTipoPava) {
        this.sombreroTipoPava = sombreroTipoPava;
    }

    public Boolean getGorraGrisLogo() {
        return gorraGrisLogo;
    }

    public void setGorraGrisLogo(Boolean gorraGrisLogo) {
        this.gorraGrisLogo = gorraGrisLogo;
    }

    public Boolean getGorraAzul() {
        return gorraAzul;
    }

    public void setGorraAzul(Boolean gorraAzul) {
        this.gorraAzul = gorraAzul;
    }

    public Boolean getBotasDielectricas() {
        return botasDielectricas;
    }

    public void setBotasDielectricas(Boolean botasDielectricas) {
        this.botasDielectricas = botasDielectricas;
    }

    public Boolean getBotasPHierro() {
        return botasPHierro;
    }

    public void setBotasPHierro(Boolean botasPHierro) {
        this.botasPHierro = botasPHierro;
    }

    public Boolean getBotasCanaLarga() {
        return botasCanaLarga;
    }

    public void setBotasCanaLarga(Boolean botasCanaLarga) {
        this.botasCanaLarga = botasCanaLarga;
    }

    public Boolean getCaretaSoldar() {
        return caretaSoldar;
    }

    public void setCaretaSoldar(Boolean caretaSoldar) {
        this.caretaSoldar = caretaSoldar;
    }

    public Boolean getGorro() {
        return gorro;
    }

    public void setGorro(Boolean gorro) {
        this.gorro = gorro;
    }

    public Boolean getMascarilla() {
        return mascarilla;
    }

    public void setMascarilla(Boolean mascarilla) {
        this.mascarilla = mascarilla;
    }

    public Boolean getRespiradorCaraCompleta() {
        return respiradorCaraCompleta;
    }

    public void setRespiradorCaraCompleta(Boolean respiradorCaraCompleta) {
        this.respiradorCaraCompleta = respiradorCaraCompleta;
    }

    public Boolean getRespiradorMedioRostro() {
        return respiradorMedioRostro;
    }

    public void setRespiradorMedioRostro(Boolean respiradorMedioRostro) {
        this.respiradorMedioRostro = respiradorMedioRostro;
    }

    public Boolean getLentesSeguridad() {
        return lentesSeguridad;
    }

    public void setLentesSeguridad(Boolean lentesSeguridad) {
        this.lentesSeguridad = lentesSeguridad;
    }

    public Boolean getLentesCopa() {
        return lentesCopa;
    }

    public void setLentesCopa(Boolean lentesCopa) {
        this.lentesCopa = lentesCopa;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public Boolean getCascoSeguridad() {
        return cascoSeguridad;
    }

    public void setCascoSeguridad(Boolean cascoSeguridad) {
        this.cascoSeguridad = cascoSeguridad;
    }

    public Boolean getCascoMotorizado() {
        return cascoMotorizado;
    }

    public void setCascoMotorizado(Boolean cascoMotorizado) {
        this.cascoMotorizado = cascoMotorizado;
    }
}
