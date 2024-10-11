import Link from "next/link";

export function Header() {

    return (

        <nav className="bg-red-600 border-gray-200 dark:bg-red-600">
            <div className="flex flex-wrap justify-between items-center mx-auto max-w-screen-xl p-4">
                <Link href="/" className="flex items-center space-x-3 rtl:space-x-reverse">
                    <img src="./logo.png" className="h-16" alt="Wiki Pokedex Logo" />
                    <span className="self-center text-2xl font-semibold whitespace-nowrap text-white dark:text-white">
                        Wiki Pokedex
                    </span>
                </Link>
                <div className="flex items-center space-x-6 rtl:space-x-reverse">
                    <Link href="/login" className="font-bold  text-blue-700 dark:text-blue-700 hover:underline">
                        Entrar
                    </Link>
                </div>
            </div>
        </nav>

    )
}