# Ruby Project
## MarginalValera

![Unit Tests & Lint](https://github.com/JokePenny/MarginalValera/workflows/Unit%20Tests%20&%20Lint/badge.svg)

## Install

```bash
gem install bundler
bundle install
```

## Run test

```bash
rspec
```

## Run rubocop

```bash
rubocop -a 
```

### Valera parameters:
 - health = 100
 - mana = 0
 - positive = 0
 - tiredness = 0
 - money = 0

### Possible actions: 

##### Go to work (only possible if mana < 50 and tiredness < 10)
- `-`5 positive
- `-`30 mana
- `+`$100
- `+`70 tiredness

##### Contemplate nature
- `+`1 positive
- `-`10 mana
- `+`10 tiredness

##### Drink wine and watch serial
- `-`1 positive
- `+`30 mana
- `+`10 tiredness
- `-`5 health
- `-`$20

##### Go to a bar:
- `+`1 positive
- `+`60 mana
- `+`40 tiredness
- `-`10 health
- `-`$100

##### Drinking with marginalized individuals
- `+`5 positive
- `-`80 health
- `+`90 mana
- `+`80 tiredness
- `-`$150

##### Sing in the subway:
- `+`1 positive
- `+`10 mana
- `+`$10 (+ $50 more if alcohol was originally > 40 & < 70)
- `+`20 tiredness

##### Sleep
- `+`90 health (if mana < 30)
- `-`3 positive (if mana > 70)
- `-`50 mana
- `-`70 tiredness

