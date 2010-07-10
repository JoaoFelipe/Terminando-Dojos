describe('Jokenpo', {

    'Papel x Papel empata': function() {
        value_of(jokenpo("papel", "papel")).should_be("empate");
    },

    'Pedra x Pedra empata': function() {
        value_of(jokenpo("pedra", "pedra")).should_be("empate");
    },

    'Tesoura x Tesoura empata': function() {
        value_of(jokenpo("tesoura", "tesoura")).should_be("empate");
    },

    'Tesoura x Papel ganha Tesoura': function() {
        value_of(jokenpo("tesoura", "papel")).should_be("tesoura");
    },

    'Tesoura x Pedra, ganha Pedra': function() {
        value_of(jokenpo("tesoura", "pedra")).should_be("pedra");
    },

    'Papel x Tesoura ganha Tesoura': function() {
        value_of(jokenpo("papel", "tesoura")).should_be("tesoura");
    },

    'Papel x Pedra, ganha Papel': function() {
        value_of(jokenpo("papel", "pedra")).should_be("papel");
    },

    'Pedra x Papel, ganha Papel': function() {
        value_of(jokenpo("pedra", "papel")).should_be("papel");
    },

    'Pedra x Tesoura, ganha Pedra': function() {
        value_of(jokenpo("pedra", "tesoura")).should_be("pedra");
    }
});

describe('JogadorJokenpo', {

    'Pedro jogou Pedra x João jogou Tesoura, ganha Pedro': function() {
        var jogada1 = new Jogada("Pedro", "pedra" )
        var jogada2 = new Jogada("João", "tesoura" )
        var vencedor = "Pedro"
        value_of(jogadorJokenpo(jogada1, jogada2)).should_be(vencedor);
    },
    'Pedro jogou Pedra x João jogou Papel, ganha João': function() {
        var jogada1 = new Jogada("Pedro", "pedra" )
        var jogada2 = new Jogada("João", "papel" )
        var vencedor = "João"
        value_of(jogadorJokenpo(jogada1, jogada2)).should_be(vencedor);
    },
    'Pedro jogou Pedra x João jogou Pedra, empate': function() {
        var jogada1 = new Jogada("Pedro", "pedra" )
        var jogada2 = new Jogada("João", "pedra" )
        var vencedor = "empate"
        value_of(jogadorJokenpo(jogada1, jogada2)).should_be(vencedor);
    },
    'Pedro jogou Tesoura x João jogou Pedra, ganha João': function() {
        var jogada1 = new Jogada("Pedro", "tesoura" )
        var jogada2 = new Jogada("João", "pedra" )
        var vencedor = "João"
        value_of(jogadorJokenpo(jogada1, jogada2)).should_be(vencedor);
    },
    'Pedro jogou Tesoura x João jogou Papel, ganha Pedro': function() {
        var jogada1 = new Jogada("Pedro", "tesoura" )
        var jogada2 = new Jogada("João", "papel" )
        var vencedor = "Pedro"
        value_of(jogadorJokenpo(jogada1, jogada2)).should_be(vencedor);
    }
})
