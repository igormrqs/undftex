"""Protótipo didático: valida uma solicitação isolada, sem registrar reservas."""

from datetime import datetime
import json
from pathlib import Path


def validar(solicitacao):
    if not solicitacao["solicitante"].strip() or not solicitacao["sala"].strip():
        return "campos_obrigatorios"
    try:
        inicio = datetime.strptime(solicitacao["inicio"], "%H:%M")
        fim = datetime.strptime(solicitacao["fim"], "%H:%M")
    except ValueError:
        return "horario_invalido"
    if inicio >= fim:
        return "intervalo_invalido"
    if solicitacao["participantes"] > solicitacao["capacidade"]:
        return "capacidade_excedida"
    return "aceita"


if __name__ == "__main__":
    casos = json.loads(Path(__file__).with_name("casos.json").read_text(encoding="utf-8"))
    for caso in casos:
        obtido = validar(caso["entrada"])
        if obtido != caso["esperado"]:
            raise AssertionError(f"{caso['id']}: esperado {caso['esperado']}, obtido {obtido}")
        print(f"{caso['id']}: {obtido}")
    print(f"{len(casos)}/{len(casos)} casos com resultado esperado")
