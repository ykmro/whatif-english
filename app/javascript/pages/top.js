document.addEventListener('turbo:load', () => {
  const speak = (text, { rate = 1.0, pitch = 1.0 } = {}) => {
    if (!window.speechSynthesis) return null;
    window.speechSynthesis.cancel();
    const utterance = new SpeechSynthesisUtterance(text);
    utterance.lang = 'en-US';
    utterance.rate = rate;
    utterance.pitch = pitch;
    utterance.volume = 1.0;
    const applyVoice = () => {
      const voices = window.speechSynthesis.getVoices();
      const maleVoice =
        voices.find(v => v.lang.startsWith('en') && /alex|david|daniel|fred|tom|male/i.test(v.name)) ||
        voices.find(v => v.lang.startsWith('en'));
      if (maleVoice) utterance.voice = maleVoice;
      window.speechSynthesis.speak(utterance);
    };
    if (window.speechSynthesis.getVoices().length > 0) {
      applyVoice();
    } else {
      window.speechSynthesis.addEventListener('voiceschanged', applyVoice, { once: true });
    }
    return utterance;
  };

  const playSound = (isCorrect) => {
    const AudioCtx = window.AudioContext || window.webkitAudioContext;
    if (!AudioCtx) return;
    const ctx = new AudioCtx();
    if (isCorrect) {
      [523, 659, 784].forEach((freq, i) => {
        const osc = ctx.createOscillator();
        const gain = ctx.createGain();
        osc.connect(gain);
        gain.connect(ctx.destination);
        osc.type = 'sine';
        osc.frequency.value = freq;
        const t = ctx.currentTime + i * 0.12;
        gain.gain.setValueAtTime(0.3, t);
        gain.gain.exponentialRampToValueAtTime(0.001, t + 0.4);
        osc.start(t);
        osc.stop(t + 0.4);
      });
    } else {
      const osc = ctx.createOscillator();
      const gain = ctx.createGain();
      osc.connect(gain);
      gain.connect(ctx.destination);
      osc.type = 'sine';
      osc.frequency.setValueAtTime(380, ctx.currentTime);
      osc.frequency.exponentialRampToValueAtTime(220, ctx.currentTime + 0.5);
      gain.gain.setValueAtTime(0.3, ctx.currentTime);
      gain.gain.exponentialRampToValueAtTime(0.001, ctx.currentTime + 0.55);
      osc.start(ctx.currentTime);
      osc.stop(ctx.currentTime + 0.55);
    }
  };

  document.querySelectorAll('#choice_form input[type="radio"]').forEach(radio => {
    radio.addEventListener('change', () => {
      const isCorrect = radio.dataset.correct === 'true';

      const overlay = document.getElementById('answer-overlay');
      if (overlay) {
        const correctIcon = document.getElementById('overlay-correct');
        const incorrectIcon = document.getElementById('overlay-incorrect');
        correctIcon.classList.remove('is-animating');
        incorrectIcon.classList.remove('is-animating');
        overlay.classList.add('is-active');
        playSound(isCorrect);
        requestAnimationFrame(() => {
          (isCorrect ? correctIcon : incorrectIcon).classList.add('is-animating');
        });
        setTimeout(() => {
          document.getElementById('choice_form').requestSubmit();
        }, 1500);
      } else {
        document.getElementById('choice_form').requestSubmit();
      }
    });
  });

  document.querySelectorAll('.choice-speaker').forEach(btn => {
    btn.addEventListener('click', (e) => {
      e.stopPropagation();
      const text = btn.dataset.text;
      const utterance = speak(text, { rate: 0.9, pitch: 0.8 });
      if (utterance) {
        btn.classList.add('is-speaking');
        utterance.addEventListener('end', () => btn.classList.remove('is-speaking'));
      }
    });
  });
});
