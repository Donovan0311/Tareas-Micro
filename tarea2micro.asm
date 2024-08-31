;programa
.org 0000h
	ld b, 4
	ld c, 11
	ld A,B
	call hex_bcd
	ld d,a
; convertir c

	ld a, c
	call hex_bcd
	ld e,a
; sumar l0s dos numeros

	ld a,d
	add a,e
	daa
	ld l, a

;DECENAS
	LD A, D
	RRCA
	RRCA
	rrca
	rrca
	ld h, a

;centenas
	ld a,d
	srl d
	srl d
	srl d
	srl d
	ld a,e
	srl e
	srl e
	srl e
	srl e
	add a,d
	ld h,a


hex_bcd:
	ld l, a
	ld a, 0
	ld b, 11
ciclo_de_conversion
	sub b
	jr c, conversion_listo
	inc a
	jr ciclo_de_conversion
conversion_listo
	add a,l
	ret


