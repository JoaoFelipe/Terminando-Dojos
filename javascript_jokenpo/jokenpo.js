function jokenpo (mao1, mao2) {
    var tabelaDeJogadas = {
    "pedra":{
        "pedra":"empate",
        "papel":"papel",
        "tesoura":"pedra"
    },
    "papel":{
        "pedra":"papel",
        "papel":"empate",
        "tesoura":"tesoura"
    },
    "tesoura":{
        "pedra":"pedra",
        "papel":"tesoura",
        "tesoura":"empate"
    }
    };
    return tabelaDeJogadas[mao1][mao2];
}

function Jogada(nome, mao){
    this.nomeDoJogador = nome
    this.mao = mao
}

function jogadorJokenpo(jogada1, jogada2)
{
    var resultado = jokenpo(jogada1.mao, jogada2.mao);
    if (jogada1.mao == resultado)
        return jogada1.nomeDoJogador;
    if (jogada2.mao == resultado)
        return jogada2.nomeDoJogador;
    return "empate"
}
