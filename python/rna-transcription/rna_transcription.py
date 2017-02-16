def to_rna(dna):
    TRANSCRIPTION = {
        'G': 'C',
        'C': 'G',
        'T': 'A',
        'A': 'U'
        }
    try:
        transcribe = lambda nucleotide: TRANSCRIPTION[nucleotide]
        return ''.join(map(transcribe, list(dna)))
    except:
        return ''

