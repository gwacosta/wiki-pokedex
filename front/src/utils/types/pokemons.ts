import { GrupoI } from "./grupos";

export interface PokemonI {
    id: number;
    nome: string;
    numero: number;
    peso: number;
    altura: number;
    habPassiva: string;
    descricao: string;
    tipos: any;
    fraquezas: any;
    foto: string;
    grupo: GrupoI
    grupoId: number;
    evolucao?: PokemonI | null;
    evoluiDe?: PokemonI | null;
    evolucaoId?: number;
    evoluiDeId?: number;
}
