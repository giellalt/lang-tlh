
# Morphology of tlhIngan HoI (Klingon)
This is an example morphology, for the purpose of demonstrating giellatekno
morphology infrastructure. The example language we use is a popular conlang
by the name of tlhIngan, popularly known by the English name Klingon. This
description uses latinised form, for yet-to-be encoded Klingon orthography,
a spelling variant rule is provided.

# Definitions for Multichar_Symbols@CODE@

## Analysis symbols
The morphological analyses of wordforms of Klingon language are presented
in this system in terms of following symbols.

The parts-of-speech are:
`Multichar_Symbols@CODE@` for noun,
`Multichar_Symbols@CODE@` for verb (and "adjectives"),
`Multichar_Symbols@CODE@` for pronouns,
`Multichar_Symbols@CODE@` for numerals,
`Multichar_Symbols@CODE@` for conjunctions,
`Multichar_Symbols@CODE@` for adverbs,
`Multichar_Symbols@CODE@` for interjections, and
`Multichar_Symbols@CODE@` for other, unclassified particles.

The nominals are inflected in following Numbers, cases and
augmentation:
`Multichar_Symbols@CODE@` for singular,
`Multichar_Symbols@CODE@` for plural,
`Multichar_Symbols@CODE@` for locative,
`Multichar_Symbols@CODE@` for instructive,
`Multichar_Symbols@CODE@` for instrumental,
`Multichar_Symbols@CODE@` for benefactive,
`Multichar_Symbols@CODE@` for augmentative, and
`Multichar_Symbols@CODE@` for diminitive

The possession is marked as such:
`Multichar_Symbols@CODE@` for first singular (mine)
`Multichar_Symbols@CODE@` for second singular (yours)
`Multichar_Symbols@CODE@` for third singular (his/hers/its/theirs)
`Multichar_Symbols@CODE@` for first plural (ours)
`Multichar_Symbols@CODE@` for second plural (yours)
`Multichar_Symbols@CODE@` for third plural (theirs)

Verb moods are:
`Multichar_Symbols@CODE@` for indicative
`Multichar_Symbols@CODE@` for imperative
Verb tenses or aspects are:
`Multichar_Symbols@CODE@` for continuative
`Multichar_Symbols@CODE@` for perfect tense
`Multichar_Symbols@CODE@` for progressive

Verb personal forms in intransitives and unmarked objects are
`Multichar_Symbols@CODE@` for first singular (I do [[myself, to someone])
`Multichar_Symbols@CODE@` for second singular (you do [[yourself, to someone])
`Multichar_Symbols@CODE@` for third singular (he/she/it/they do [[theirself, to someone])
`Multichar_Symbols@CODE@` for first plural (we do [[ourself, to someone])
`Multichar_Symbols@CODE@` for first singular (you do [[yourselves, to someone])
`Multichar_Symbols@CODE@` for first singular (they do [[theirselves, to somone])

The verb personal forms objects are tagged separately:
`Multichar_Symbols@CODE@` for first singular (– – does to me)
`Multichar_Symbols@CODE@` for second singular (– – does to you])
`Multichar_Symbols@CODE@` for third singular (– – does to them)
`Multichar_Symbols@CODE@` for first plural (– – does to us)
`Multichar_Symbols@CODE@` for first singular (– – does to you)
`Multichar_Symbols@CODE@` for first singular (– – does to them)

Other verb forms are
`Multichar_Symbols@CODE@` negated form
`Multichar_Symbols@CODE@` reflexive form
`Multichar_Symbols@CODE@` reciprocal form

`Multichar_Symbols@CODE@`
* +Symbol© = independent symbols in the text stream, like £, €, ©
Special symbols are classified with:
`+Symbol©`
`+Symbol©`
`+Symbol©`
`+Symbol©` 
The verbs are syntactically split according to transitivity:
`+Symbol©` transitive
`+Symbol©` intransitive

Question and Focus particles:
`+Symbol©` for question form
`+Symbol©` other focus
`+Symbol©` contrastive this focus
`+Symbol©` contrastive that focus

Derivations are classified under the morphophonetic form of the suffix, the
source and target part-of-speech.


## Flag diacritics
We have manually optimised the structure of our lexicon using following
flag diacritics to restrict morhpological combinatorics - only allow compounds
with verbs if the verb is further derived into a noun again:
|  @P.NeedNoun.ON@nominalised | (Dis)allow compounds with verbs unless nominalised
|  @D.NeedNoun.ON@nominalised | (Dis)allow compounds with verbs unless nominalised
|  @C.NeedNoun@nominalised | (Dis)allow compounds with verbs unless nominalised

For languages that allow compounding, the following flag diacritics are needed
to control position-based compounding restrictions for nominals. Their use is
handled automatically if combined with +CmpN/xxx tags. If not used, they will
do no harm.
|  @P.CmpFrst.FALSE@first | Require that words tagged as such only appear first
|  @D.CmpPref.TRUE@ENDLEX | Block such words from entering ENDLEX
|  @P.CmpPref.FALSE@compounds | Block these words from making further compounds
|  @D.CmpLast.TRUE@R | Block such words from entering R
|  @D.CmpNone.TRUE@compounding | Combines with the next tag to prohibit compounding
|  @U.CmpNone.FALSE@compounding | Combines with the prev tag to prohibit compounding
|  @P.CmpOnly.TRUE@R | Sets a flag to indicate that the word has passed R
|  @D.CmpOnly.FALSE@root. | Disallow words coming directly from root.

Use the following flag diacritics to control downcasing of derived proper
nouns (e.g. Finnish Pariisi -> pariisilainen). See e.g. North Sámi for how to use
these flags. There exists a ready-made regex that will do the actual down-casing
given the proper use of these flags.
|  @U.Cap.Obl@deatnulasj. | Allowing downcasing of derived names: deatnulasj.
|  @U.Cap.Opt@deatnulasj. | Allowing downcasing of derived names: deatnulasj.

The word forms in Klingon language start from the lexeme roots of basic
word classes.
€gt-norm: Klingon poses
€ Sus Sus+N wind
€ jIJ jIH+Pron I
€ je je+Conj and
€ batlh batlh+Adv with honor
€ ghobe’ ghobe’+Intj no (as in discourse response)
The verbs require obligatory prefix that is the personal inflection or
imperative mood

*Klingon verb example examples:*
* *Qong* `3Sg+Qong+V` (Eng. sleeps)

* * *
<small>This (part of) documentation was generated from [../src/fst/root.lexc](http://github.com/giellalt/lang-tlh/blob/main/../src/fst/root.lexc)</small>