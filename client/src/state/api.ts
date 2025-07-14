import { createApi, fetchBaseQuery } from "@reduxjs/toolkit/query/react";

export interface Product {
	productID: string;
	name: string;
	price: number;
	rating?: number;
	stockQuantity: number;
}

export interface User {
	userID: string;
	name: string;
	email: string;
}

export interface NewProduct {
	name: string;
	price: number;
	rating?: number;
	stockQuantity: number;
}

export interface SalesSummary {
	salesSummaryID: string;
	totalValue: number;
	changePercent: number;
	date: string;
}

export interface PurchaseSummary {
	purchaseSummaryID: string;
	totalPurchased: number;
	changePercent?: number;
	date: string;
}

export interface ExpenseSummary {
	expenseSummaryID: string;
	totalExpenses: number;
	date: string;
}

export interface ExpenseByCategorySummary {
	expenseByCategorySummaryID: string;
	category: string;
	amount: string;
	date: string;
}

export interface DashboardMetrics {
	popularProducts: Product[];
	salesSummary: SalesSummary[];
	purchaseSummary: PurchaseSummary[];
	expenseSummary: ExpenseSummary[];
	expenseByCategorySummary: ExpenseByCategorySummary[];
}

export const api = createApi({
	baseQuery: fetchBaseQuery({ baseUrl: process.env.NEXT_PUBLIC_API_BASE_URL }),
	reducerPath: "api",
	tagTypes: ["DashboardMetrics", "Users", "Expenses", "Products"],
	endpoints: (build) => ({
		getDashboardMetrics: build.query<DashboardMetrics, void>({
			query: () => "/dashboard",
			providesTags: ["DashboardMetrics"],
		}),
		getProducts: build.query<Product[], string | void>({
			query: (search) => ({
				url: "/products",
				params: search ? { search } : {},
			}),
			providesTags: ["Products"],
		}),
		getUsers: build.query<User[], void>({
			query: () => "/users",
			providesTags: ["Users"],
		}),
		getExpensesByCategory: build.query<ExpenseByCategorySummary[], void>({
			query: () => "/expenses",
			providesTags: ["Expenses"],
		}),

		createProduct: build.mutation<Product, NewProduct>({
			query: (newProduct) => ({
				url: "/products",
				method: "POST",
				body: newProduct,
			}),
			invalidatesTags: ["Products"],
		}),
	}),
});

export const {
	useGetDashboardMetricsQuery,
	useGetProductsQuery,
	useGetUsersQuery,
	useGetExpensesByCategoryQuery,
	useCreateProductMutation,
} = api;
