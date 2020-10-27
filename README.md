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

### Valera parameters
 - health (0; 100)
 - mana (0; 100)
 - fun (-10; 10)
 - tire (0; 100)
 - money

### Possible actions: 

##### Go to work (Only possible if alcohol < 50 and fatigue < 10)
- `-`5 fun
- `-`30 mana
- `+`$100
- `+`70 tire

##### Contemplate nature
- `+`1 fun
- `-`10 mana
- `+`10 tire

##### Drink wine and watch TV series
- `-`1 fun
- `+`30 mana
- `+`10 tire
- `-`5 health
- `-`$20

##### Go to a bar:
- `+`1 fun
- `+`60 mana
- `+`40 tire
- `-`10 health
- `-`$100

##### Drinking with marginalized individuals
- `+`5 fun
- `-`80 health
- `+`90 mana
- `+`80 tire
- `-`$150

##### Sing in the subway:
- `+`1 fun
- `+`10 mana
- `+`$10 (+ $50 more if alcohol was originally > 40 & < 70)
- `+`20 tire

##### Sleep
- `+`90 health if alcohol <30
- `-`3 fun if alcohol> 70
- `-`50 mana
- `-`70 tire

