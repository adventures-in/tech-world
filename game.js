// ============================================================
// No Thanks! – Full game implementation
// ============================================================

(function () {
  'use strict';

  // ---- DOM refs ----
  const setupScreen   = document.getElementById('setup-screen');
  const gameScreen    = document.getElementById('game-screen');
  const gameoverScreen = document.getElementById('gameover-screen');
  const startBtn      = document.getElementById('start-btn');
  const replayBtn     = document.getElementById('replay-btn');
  const takeBtn       = document.getElementById('take-btn');
  const passBtn       = document.getElementById('pass-btn');
  const cardValueEl   = document.getElementById('card-value');
  const chipCountEl   = document.getElementById('chip-count');
  const deckCountEl   = document.getElementById('deck-count');
  const playersArea   = document.getElementById('players-area');
  const actionArea    = document.getElementById('action-area');
  const messageBar    = document.getElementById('message-bar');
  const finalScores   = document.getElementById('final-scores');
  const currentCardEl = document.getElementById('current-card');

  const AI_NAMES = ['Alice', 'Bob', 'Carol', 'Dave'];

  // ---- Game state ----
  let state = {};

  // ---- Helpers ----
  function shuffle(arr) {
    for (let i = arr.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [arr[i], arr[j]] = [arr[j], arr[i]];
    }
    return arr;
  }

  function showScreen(screen) {
    [setupScreen, gameScreen, gameoverScreen].forEach(s => s.classList.add('hidden'));
    screen.classList.remove('hidden');
  }

  function setMessage(msg) {
    messageBar.textContent = msg;
  }

  // ---- Scoring ----
  function calcScore(player) {
    const cards = [...player.cards].sort((a, b) => a - b);
    let cardPoints = 0;
    let i = 0;
    while (i < cards.length) {
      // start of a run
      const runStart = cards[i];
      while (i < cards.length - 1 && cards[i + 1] === cards[i] + 1) {
        i++;
      }
      cardPoints += runStart; // only lowest card in run counts
      i++;
    }
    return cardPoints - player.chips;
  }

  // ---- Init game ----
  function initGame() {
    const playerName = document.getElementById('player-name').value.trim() || 'You';
    const numPlayers = parseInt(document.getElementById('num-players').value, 10);

    // Build deck: 3-35, remove 9 random
    let deck = [];
    for (let v = 3; v <= 35; v++) deck.push(v);
    shuffle(deck);
    deck = deck.slice(9); // 24 cards remain
    shuffle(deck);

    // Starting chips per player count
    const chipsPerPlayer = { 3: 11, 4: 11, 5: 11 };
    const startChips = chipsPerPlayer[numPlayers] || 11;

    const players = [];
    players.push({ name: playerName, chips: startChips, cards: [], isHuman: true });
    const aiNames = shuffle([...AI_NAMES]).slice(0, numPlayers - 1);
    for (const name of aiNames) {
      players.push({ name, chips: startChips, cards: [], isHuman: false });
    }

    state = {
      deck,
      players,
      currentPlayerIdx: 0,
      currentCard: deck.pop(),
      chipsOnCard: 0,
      gameOver: false,
    };

    showScreen(gameScreen);
    renderAll();

    // Animate the first card
    currentCardEl.classList.add('pop');
    setTimeout(() => currentCardEl.classList.remove('pop'), 400);

    // If first player is AI, kick off AI turn
    if (!currentPlayer().isHuman) {
      actionArea.classList.add('hidden');
      scheduleAiTurn();
    } else {
      actionArea.classList.remove('hidden');
      updatePassButton();
      setMessage('Your turn! Take the card or say No Thanks.');
    }
  }

  function currentPlayer() {
    return state.players[state.currentPlayerIdx];
  }

  // ---- Render ----
  function renderAll() {
    // Deck count
    deckCountEl.textContent = `Cards left: ${state.deck.length}`;

    // Current card
    cardValueEl.textContent = state.currentCard;
    chipCountEl.textContent = state.chipsOnCard;

    // Players
    playersArea.innerHTML = '';
    state.players.forEach((p, idx) => {
      const panel = document.createElement('div');
      panel.className = 'player-panel';
      if (p.isHuman) panel.classList.add('human');
      if (idx === state.currentPlayerIdx && !state.gameOver) panel.classList.add('active');

      const sortedCards = [...p.cards].sort((a, b) => a - b);
      const runs = markRuns(sortedCards);

      panel.innerHTML = `
        <div class="player-name">
          ${p.name}${p.isHuman ? '<span class="you-badge">YOU</span>' : ''}
        </div>
        <div class="player-chips">Chips: ${p.chips}</div>
        <div class="player-cards">
          ${runs.map(c => `<span class="mini-card${c.inRun ? ' run' : ''}">${c.value}</span>`).join('')}
        </div>
      `;
      playersArea.appendChild(panel);
    });
  }

  function markRuns(sorted) {
    if (sorted.length === 0) return [];
    const result = sorted.map(v => ({ value: v, inRun: false }));
    for (let i = 0; i < result.length; i++) {
      if (i > 0 && result[i].value === result[i - 1].value + 1) {
        result[i].inRun = true;
        result[i - 1].inRun = true;
      }
    }
    return result;
  }

  function updatePassButton() {
    const p = currentPlayer();
    passBtn.disabled = p.chips <= 0;
  }

  // ---- Player actions ----
  function takeCard() {
    const p = currentPlayer();
    p.cards.push(state.currentCard);
    p.chips += state.chipsOnCard;
    state.chipsOnCard = 0;

    if (p.isHuman) {
      setMessage(`You took the ${state.currentCard} card.`);
    } else {
      setMessage(`${p.name} took the ${state.currentCard} card.`);
    }

    // Flip next card (same player gets next turn)
    if (state.deck.length > 0) {
      state.currentCard = state.deck.pop();
      currentCardEl.classList.add('pop');
      setTimeout(() => currentCardEl.classList.remove('pop'), 400);
      renderAll();
      startTurn();
    } else {
      endGame();
    }
  }

  function passCard() {
    const p = currentPlayer();
    if (p.chips <= 0) return; // can't pass
    p.chips--;
    state.chipsOnCard++;

    if (p.isHuman) {
      setMessage('You said No Thanks!');
    } else {
      setMessage(`${p.name} said No Thanks!`);
    }

    advancePlayer();
    renderAll();
    startTurn();
  }

  function advancePlayer() {
    state.currentPlayerIdx = (state.currentPlayerIdx + 1) % state.players.length;
  }

  function startTurn() {
    const p = currentPlayer();
    if (p.isHuman) {
      actionArea.classList.remove('hidden');
      updatePassButton();
    } else {
      actionArea.classList.add('hidden');
      scheduleAiTurn();
    }
  }

  // ---- AI ----
  function scheduleAiTurn() {
    const delay = 600 + Math.random() * 500;
    setTimeout(doAiTurn, delay);
  }

  function doAiTurn() {
    const p = currentPlayer();
    const card = state.currentCard;
    const chips = state.chipsOnCard;

    const shouldTake = aiDecision(p, card, chips);
    if (shouldTake || p.chips <= 0) {
      takeCard();
    } else {
      passCard();
    }
  }

  function aiDecision(player, card, chipsOnCard) {
    // Check if the card extends or is adjacent to an existing run
    const sorted = [...player.cards].sort((a, b) => a - b);
    const hasAdjacent = sorted.includes(card - 1) || sorted.includes(card + 1);

    // The "effective cost" of the card considering runs
    let effectiveCost = card;
    if (hasAdjacent) {
      // If it extends a run, the card is essentially free (already counted)
      effectiveCost = 0;
    }

    const netCost = effectiveCost - chipsOnCard;

    // Decision thresholds with some randomness
    if (hasAdjacent) {
      // Almost always take cards that extend runs
      return true;
    }

    if (netCost <= 0) {
      // Chips on card cover the cost — take it
      return true;
    }

    // Take low cards more willingly
    if (card <= 10 && netCost <= 3) return true;
    if (card <= 15 && netCost <= 2) return true;
    if (card <= 20 && chipsOnCard >= card * 0.3) return true;

    // Random factor: occasionally take a mediocre deal
    if (chipsOnCard >= 3 && Math.random() < 0.3) return true;

    // Don't spend chips recklessly — take if chips are low
    if (player.chips <= 2 && chipsOnCard >= 2) return true;

    return false;
  }

  // ---- End Game ----
  function endGame() {
    state.gameOver = true;
    actionArea.classList.add('hidden');
    setMessage('');

    const results = state.players.map(p => ({
      name: p.name,
      cards: [...p.cards].sort((a, b) => a - b),
      chips: p.chips,
      score: calcScore(p),
      isHuman: p.isHuman,
    }));

    results.sort((a, b) => a.score - b.score);

    finalScores.innerHTML = '';
    results.forEach((r, i) => {
      const row = document.createElement('div');
      row.className = 'score-row' + (i === 0 ? ' winner' : '');
      const cardStr = r.cards.join(', ');
      row.innerHTML = `
        <span class="rank">#${i + 1}</span>
        <span class="name">${r.name}${r.isHuman ? ' (You)' : ''}</span>
        <span class="detail">Cards: [${cardStr}] | Chips: ${r.chips}</span>
        <span class="score">${r.score} pts</span>
      `;
      finalScores.appendChild(row);
    });

    showScreen(gameoverScreen);
  }

  // ---- Event listeners ----
  startBtn.addEventListener('click', initGame);
  replayBtn.addEventListener('click', () => showScreen(setupScreen));
  takeBtn.addEventListener('click', () => {
    if (currentPlayer().isHuman) takeCard();
  });
  passBtn.addEventListener('click', () => {
    if (currentPlayer().isHuman) passCard();
  });

  // Keyboard shortcuts
  document.addEventListener('keydown', (e) => {
    if (state.gameOver || !currentPlayer()?.isHuman) return;
    if (actionArea.classList.contains('hidden')) return;
    if (e.key === 't' || e.key === 'T' || e.key === 'Enter') {
      takeBtn.click();
    } else if (e.key === 'n' || e.key === 'N' || e.key === ' ') {
      if (!passBtn.disabled) passBtn.click();
    }
  });
})();
