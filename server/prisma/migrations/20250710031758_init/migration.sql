-- CreateTable
CREATE TABLE "Users" (
    "userID" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,

    CONSTRAINT "Users_pkey" PRIMARY KEY ("userID")
);

-- CreateTable
CREATE TABLE "Products" (
    "productID" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "rating" DOUBLE PRECISION,
    "stockQuantity" INTEGER NOT NULL,

    CONSTRAINT "Products_pkey" PRIMARY KEY ("productID")
);

-- CreateTable
CREATE TABLE "Sales" (
    "saleID" TEXT NOT NULL,
    "productID" TEXT NOT NULL,
    "timestamp" TIMESTAMP(3) NOT NULL,
    "quantity" INTEGER NOT NULL,
    "unitPrice" DOUBLE PRECISION NOT NULL,
    "totalAmount" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "Sales_pkey" PRIMARY KEY ("saleID")
);

-- CreateTable
CREATE TABLE "Purchases" (
    "purchaseID" TEXT NOT NULL,
    "productID" TEXT NOT NULL,
    "timestamp" TIMESTAMP(3) NOT NULL,
    "quantity" INTEGER NOT NULL,
    "unitCost" DOUBLE PRECISION NOT NULL,
    "totalCost" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "Purchases_pkey" PRIMARY KEY ("purchaseID")
);

-- CreateTable
CREATE TABLE "Expenses" (
    "expenseID" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "amount" DOUBLE PRECISION NOT NULL,
    "timestamp" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Expenses_pkey" PRIMARY KEY ("expenseID")
);

-- CreateTable
CREATE TABLE "SalesSummary" (
    "salesSummaryID" TEXT NOT NULL,
    "totalValue" DOUBLE PRECISION NOT NULL,
    "changePercent" DOUBLE PRECISION,
    "date" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SalesSummary_pkey" PRIMARY KEY ("salesSummaryID")
);

-- CreateTable
CREATE TABLE "PurchaseSummary" (
    "purchaseSummaryID" TEXT NOT NULL,
    "totalPurchased" DOUBLE PRECISION NOT NULL,
    "changePercent" DOUBLE PRECISION,
    "date" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PurchaseSummary_pkey" PRIMARY KEY ("purchaseSummaryID")
);

-- CreateTable
CREATE TABLE "ExpenseSummary" (
    "expenseSummaryID" TEXT NOT NULL,
    "totalExpenses" DOUBLE PRECISION NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ExpenseSummary_pkey" PRIMARY KEY ("expenseSummaryID")
);

-- CreateTable
CREATE TABLE "ExpenseByCategory" (
    "expenseByCategoryID" TEXT NOT NULL,
    "expenseSummaryID" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "amount" BIGINT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ExpenseByCategory_pkey" PRIMARY KEY ("expenseByCategoryID")
);

-- AddForeignKey
ALTER TABLE "Sales" ADD CONSTRAINT "Sales_productID_fkey" FOREIGN KEY ("productID") REFERENCES "Products"("productID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Purchases" ADD CONSTRAINT "Purchases_productID_fkey" FOREIGN KEY ("productID") REFERENCES "Products"("productID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ExpenseByCategory" ADD CONSTRAINT "ExpenseByCategory_expenseSummaryID_fkey" FOREIGN KEY ("expenseSummaryID") REFERENCES "ExpenseSummary"("expenseSummaryID") ON DELETE RESTRICT ON UPDATE CASCADE;
