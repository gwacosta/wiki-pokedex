import { create } from 'zustand'
import { TreinadorI } from '@/utils/types/treinadores'

type TreinadorStore = {
    treinador: TreinadorI
    logaTreinador: (treinadorLogado: TreinadorI) => void
    deslogaTreinador: () => void

}

export const useTreinadorStore = create<TreinadorStore>((set) => ({
    treinador: {} as TreinadorI,
    logaTreinador: (treinadorLogado) => set({ treinador: treinadorLogado }),
    deslogaTreinador: () => set({ treinador: {} as TreinadorI }),
    
    //   bears: 0,
    //   increasePopulation: () => set((state) => ({ bears: state.bears + 1 })),
    //   removeAllBears: () => set({ bears: 0 }),
    //   updateBears: (newBears) => set({ bears: newBears }),
}))