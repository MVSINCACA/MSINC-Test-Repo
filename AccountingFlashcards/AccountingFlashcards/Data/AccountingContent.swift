import Foundation

struct AccountingContent {

    static let allDecks: [Deck] = [
        fundamentalsDeck,
        debitsAndCreditsDeck,
        balanceSheetDeck,
        incomeStatementDeck,
        cashFlowDeck,
        journalEntriesDeck,
        financialRatiosDeck,
        terminologyDeck
    ]

    // MARK: - Fundamentals Deck

    static let fundamentalsDeck = Deck(
        id: UUID(),
        title: "Accounting Fundamentals",
        description: "Core principles and the accounting equation",
        category: .fundamentals,
        cards: [
            Flashcard(
                question: "What is the Accounting Equation?",
                answer: "Assets = Liabilities + Owner's Equity\n\nThis equation must always remain balanced after every transaction.",
                hint: "Think of it as what you OWN equals what you OWE plus what's yours.",
                category: .fundamentals,
                difficulty: .beginner
            ),
            Flashcard(
                question: "What is an Asset?",
                answer: "An asset is a resource owned or controlled by a company that has economic value and is expected to provide future benefits.\n\nExamples: Cash, Accounts Receivable, Inventory, Equipment, Buildings",
                hint: "Something the company OWNS.",
                category: .fundamentals,
                difficulty: .beginner
            ),
            Flashcard(
                question: "What is a Liability?",
                answer: "A liability is an obligation or debt owed by a company to another party, settled in the future by transferring assets or services.\n\nExamples: Accounts Payable, Loans Payable, Unearned Revenue",
                hint: "Something the company OWES.",
                category: .fundamentals,
                difficulty: .beginner
            ),
            Flashcard(
                question: "What is Owner's Equity?",
                answer: "Owner's Equity (also called Shareholders' Equity or Net Worth) is the residual interest in assets after deducting all liabilities.\n\nFormula: Assets - Liabilities = Owner's Equity",
                hint: "What's left for the owner after paying all debts.",
                category: .fundamentals,
                difficulty: .beginner
            ),
            Flashcard(
                question: "What is Revenue?",
                answer: "Revenue is the income generated from normal business operations—the sale of goods or services before any costs are deducted.\n\nAlso called: Sales, Turnover, or Top Line.",
                hint: "Money earned from selling goods or services.",
                category: .fundamentals,
                difficulty: .beginner
            ),
            Flashcard(
                question: "What is an Expense?",
                answer: "An expense is the cost incurred to generate revenue. It reduces owner's equity.\n\nExamples: Rent, Salaries, Utilities, Depreciation, Cost of Goods Sold",
                hint: "Costs paid to run the business.",
                category: .fundamentals,
                difficulty: .beginner
            ),
            Flashcard(
                question: "What is the Going Concern Principle?",
                answer: "The Going Concern Principle assumes a business will continue to operate indefinitely into the future, unless there is evidence to the contrary.\n\nThis affects how assets are valued—at cost rather than liquidation value.",
                hint: "The business will keep running.",
                category: .fundamentals,
                difficulty: .intermediate
            ),
            Flashcard(
                question: "What is the Matching Principle?",
                answer: "The Matching Principle states that expenses should be recognized in the same period as the revenues they help generate, regardless of when cash is paid.\n\nThis is a cornerstone of accrual accounting.",
                hint: "Match expenses to the revenue they create.",
                category: .fundamentals,
                difficulty: .intermediate
            ),
            Flashcard(
                question: "What is the Revenue Recognition Principle?",
                answer: "Revenue should be recognized (recorded) when it is earned and realizable, not necessarily when cash is received.\n\nUnder IFRS 15 / ASC 606: Revenue is recognized when control of goods/services transfers to the customer.",
                hint: "Record revenue when EARNED, not when cash arrives.",
                category: .fundamentals,
                difficulty: .intermediate
            ),
            Flashcard(
                question: "What is the difference between Cash Basis and Accrual Accounting?",
                answer: "Cash Basis: Revenue and expenses recorded only when cash changes hands.\n\nAccrual Basis: Revenue and expenses recorded when earned/incurred, regardless of cash flow.\n\nGAAP and IFRS require accrual accounting for most businesses.",
                hint: "Cash = when paid. Accrual = when earned.",
                category: .fundamentals,
                difficulty: .intermediate
            )
        ],
        color: .blue
    )

    // MARK: - Debits & Credits Deck

    static let debitsAndCreditsDeck = Deck(
        id: UUID(),
        title: "Debits & Credits",
        description: "Master the rules of double-entry bookkeeping",
        category: .debitsCredits,
        cards: [
            Flashcard(
                question: "What is Double-Entry Bookkeeping?",
                answer: "A system where every transaction affects at least two accounts. Every debit must have a corresponding credit of the same amount.\n\nThe total of all debits always equals the total of all credits.",
                hint: "Every transaction has two sides.",
                category: .debitsCredits,
                difficulty: .beginner
            ),
            Flashcard(
                question: "What does a Debit do to an Asset account?",
                answer: "A Debit INCREASES an Asset account.\n\nAssets have a normal debit balance, so debiting them makes them larger.\n\nExample: Debit Cash $500 → Cash increases by $500.",
                hint: "Assets increase with debits.",
                category: .debitsCredits,
                difficulty: .beginner
            ),
            Flashcard(
                question: "What does a Credit do to a Liability account?",
                answer: "A Credit INCREASES a Liability account.\n\nLiabilities have a normal credit balance, so crediting them makes them larger.\n\nExample: Credit Accounts Payable $500 → We owe $500 more.",
                hint: "Liabilities increase with credits.",
                category: .debitsCredits,
                difficulty: .beginner
            ),
            Flashcard(
                question: "What is the normal balance of an Expense account?",
                answer: "Expenses have a normal DEBIT balance.\n\nTo increase an expense, you DEBIT it.\nTo decrease an expense, you CREDIT it.\n\nExample: Debit Rent Expense $1,000 → records rent cost.",
                hint: "Expenses are like assets—debit to increase.",
                category: .debitsCredits,
                difficulty: .beginner
            ),
            Flashcard(
                question: "What is the normal balance of a Revenue account?",
                answer: "Revenue has a normal CREDIT balance.\n\nTo increase revenue, you CREDIT it.\nTo decrease revenue, you DEBIT it.\n\nExample: Credit Sales Revenue $2,000 → records a sale.",
                hint: "Revenue is like a liability—credit to increase.",
                category: .debitsCredits,
                difficulty: .beginner
            ),
            Flashcard(
                question: "State the DEAD CLIC memory aid for debits and credits.",
                answer: "DEAD CLIC:\n\nDEBITS increase:\n• D – Dividends\n• E – Expenses\n• A – Assets\n• D – Drawings\n\nCREDITS increase:\n• C – Capital (Equity)\n• L – Liabilities\n• I – Income (Revenue)\n• C – Capital",
                hint: "DEAD accounts increase with debits, CLIC accounts increase with credits.",
                category: .debitsCredits,
                difficulty: .beginner
            ),
            Flashcard(
                question: "A company purchases equipment for $10,000 cash. What is the journal entry?",
                answer: "Debit  Equipment         $10,000\nCredit Cash                    $10,000\n\nRationale: Equipment (asset) increases → Debit.\nCash (asset) decreases → Credit.",
                hint: "One asset goes up, one goes down.",
                category: .debitsCredits,
                difficulty: .intermediate
            ),
            Flashcard(
                question: "What is a T-Account?",
                answer: "A T-Account is a visual representation of a ledger account shaped like the letter T.\n\n• Left side = Debit side\n• Right side = Credit side\n\nThe balance is the difference between total debits and total credits.",
                hint: "Shaped like a T, left = debit, right = credit.",
                category: .debitsCredits,
                difficulty: .beginner
            ),
            Flashcard(
                question: "What is a Trial Balance?",
                answer: "A Trial Balance is a list of all ledger accounts and their balances at a specific date.\n\nPurpose: Verify that total debits = total credits.\n\nNote: A balanced trial balance does NOT guarantee error-free records.",
                hint: "A check that debits equal credits.",
                category: .debitsCredits,
                difficulty: .intermediate
            )
        ],
        color: .orange
    )

    // MARK: - Balance Sheet Deck

    static let balanceSheetDeck = Deck(
        id: UUID(),
        title: "Balance Sheet",
        description: "Assets, liabilities, and equity explained",
        category: .balanceSheet,
        cards: [
            Flashcard(
                question: "What is a Balance Sheet?",
                answer: "A Balance Sheet (Statement of Financial Position) is a snapshot of a company's financial position at a specific point in time.\n\nIt shows:\n• Assets (what the company owns)\n• Liabilities (what it owes)\n• Equity (the net worth)",
                hint: "A financial photo at one moment in time.",
                category: .balanceSheet,
                difficulty: .beginner
            ),
            Flashcard(
                question: "What are Current Assets?",
                answer: "Current Assets are assets expected to be converted to cash or used within one year (or one operating cycle, whichever is longer).\n\nExamples:\n• Cash & Cash Equivalents\n• Accounts Receivable\n• Inventory\n• Prepaid Expenses\n• Short-term Investments",
                hint: "Assets that become cash within 12 months.",
                category: .balanceSheet,
                difficulty: .beginner
            ),
            Flashcard(
                question: "What are Non-Current Assets?",
                answer: "Non-Current Assets (Long-term Assets) are assets not expected to be converted to cash within one year.\n\nExamples:\n• Property, Plant & Equipment (PP&E)\n• Intangible Assets (patents, goodwill)\n• Long-term Investments\n• Deferred Tax Assets",
                hint: "Assets held for more than one year.",
                category: .balanceSheet,
                difficulty: .intermediate
            ),
            Flashcard(
                question: "What is Accounts Receivable?",
                answer: "Accounts Receivable (AR) is money owed to the company by customers for goods or services already delivered but not yet paid for.\n\nIt is a Current Asset.\n\nAR is often shown net of an Allowance for Doubtful Accounts.",
                hint: "Money customers owe us.",
                category: .balanceSheet,
                difficulty: .beginner
            ),
            Flashcard(
                question: "What is Depreciation?",
                answer: "Depreciation is the systematic allocation of a tangible asset's cost over its useful life.\n\nCommon Methods:\n• Straight-Line: Equal amounts each year\n• Declining Balance: Higher early, lower later\n• Units of Production: Based on usage\n\nAccumulated Depreciation reduces the asset's book value.",
                hint: "Spreading an asset's cost over its life.",
                category: .balanceSheet,
                difficulty: .intermediate
            ),
            Flashcard(
                question: "What is Goodwill?",
                answer: "Goodwill is an intangible asset that arises when a company acquires another for more than the fair value of its net identifiable assets.\n\nFormula: Purchase Price − Fair Value of Net Assets = Goodwill\n\nGoodwill is tested for impairment annually (not amortized under US GAAP).",
                hint: "Premium paid above fair value in an acquisition.",
                category: .balanceSheet,
                difficulty: .advanced
            ),
            Flashcard(
                question: "What are Current Liabilities?",
                answer: "Current Liabilities are obligations due within one year.\n\nExamples:\n• Accounts Payable\n• Accrued Expenses\n• Short-term Debt\n• Current Portion of Long-term Debt\n• Unearned Revenue\n• Income Tax Payable",
                hint: "Debts due within 12 months.",
                category: .balanceSheet,
                difficulty: .beginner
            ),
            Flashcard(
                question: "What is Working Capital?",
                answer: "Working Capital measures a company's short-term liquidity.\n\nFormula: Working Capital = Current Assets − Current Liabilities\n\n• Positive: Can meet short-term obligations\n• Negative: May face liquidity problems",
                hint: "Current Assets minus Current Liabilities.",
                category: .balanceSheet,
                difficulty: .intermediate
            ),
            Flashcard(
                question: "What is Retained Earnings?",
                answer: "Retained Earnings is the cumulative net income kept in the business after paying dividends.\n\nFormula:\nBeginning RE + Net Income − Dividends = Ending RE\n\nIt is part of Shareholders' Equity on the Balance Sheet.",
                hint: "Profits kept in the business, not paid out.",
                category: .balanceSheet,
                difficulty: .intermediate
            ),
            Flashcard(
                question: "What is the difference between Book Value and Market Value?",
                answer: "Book Value: The net asset value recorded on the balance sheet (Assets − Liabilities). Based on historical cost less depreciation.\n\nMarket Value: The current price the market would pay for the asset or company.\n\nThey often differ significantly, especially for intangible-heavy businesses.",
                hint: "Book = accounting records. Market = what buyers pay.",
                category: .balanceSheet,
                difficulty: .advanced
            )
        ],
        color: .green
    )

    // MARK: - Income Statement Deck

    static let incomeStatementDeck = Deck(
        id: UUID(),
        title: "Income Statement",
        description: "Revenue, expenses, and profitability",
        category: .incomeStatement,
        cards: [
            Flashcard(
                question: "What is an Income Statement?",
                answer: "The Income Statement (Profit & Loss Statement) reports a company's revenues, expenses, and profit over a specific period.\n\nKey Line Items:\n• Revenue (Sales)\n• Cost of Goods Sold (COGS)\n• Gross Profit\n• Operating Expenses\n• Operating Income (EBIT)\n• Net Income",
                hint: "Shows profits over a time period.",
                category: .incomeStatement,
                difficulty: .beginner
            ),
            Flashcard(
                question: "What is Gross Profit?",
                answer: "Gross Profit is revenue remaining after subtracting the direct costs of producing goods or services.\n\nFormula: Gross Profit = Revenue − Cost of Goods Sold (COGS)\n\nGross Profit Margin = (Gross Profit / Revenue) × 100%",
                hint: "Revenue minus the cost to make the product.",
                category: .incomeStatement,
                difficulty: .beginner
            ),
            Flashcard(
                question: "What is EBITDA?",
                answer: "EBITDA = Earnings Before Interest, Taxes, Depreciation, and Amortization.\n\nFormula: Net Income + Interest + Taxes + Depreciation + Amortization\n\nUsed as a proxy for operating cash flow and to compare companies across capital structures.",
                hint: "Earnings before non-cash and financing charges.",
                category: .incomeStatement,
                difficulty: .intermediate
            ),
            Flashcard(
                question: "What is Operating Income (EBIT)?",
                answer: "Operating Income (EBIT) is profit from core business operations before interest and tax.\n\nFormula: Gross Profit − Operating Expenses = EBIT\n\nAlso called: Operating Profit, EBIT (Earnings Before Interest and Taxes)",
                hint: "Profit from operations before interest and tax.",
                category: .incomeStatement,
                difficulty: .intermediate
            ),
            Flashcard(
                question: "What is Net Income?",
                answer: "Net Income (Net Profit or Bottom Line) is the final profit after all revenues, expenses, taxes, and interest.\n\nFormula:\nRevenue − COGS − Operating Expenses − Interest − Taxes = Net Income\n\nNet Income flows to Retained Earnings on the Balance Sheet.",
                hint: "The final profit—the 'bottom line'.",
                category: .incomeStatement,
                difficulty: .beginner
            ),
            Flashcard(
                question: "What is Cost of Goods Sold (COGS)?",
                answer: "COGS includes all direct costs attributable to the production of goods sold.\n\nFor manufacturers: Direct materials + Direct labor + Manufacturing overhead\nFor retailers: Purchase price of inventory sold\n\nFormula: Beginning Inventory + Purchases − Ending Inventory = COGS",
                hint: "Direct costs to produce what was sold.",
                category: .incomeStatement,
                difficulty: .intermediate
            ),
            Flashcard(
                question: "What is the difference between Operating and Non-Operating Income?",
                answer: "Operating Income: Profit from the company's core business activities (e.g., selling products/services).\n\nNon-Operating Income: Income from peripheral activities, such as:\n• Interest income\n• Investment gains\n• Foreign exchange gains\n• Sale of assets",
                hint: "Core business vs. side activities.",
                category: .incomeStatement,
                difficulty: .intermediate
            ),
            Flashcard(
                question: "What is EPS (Earnings Per Share)?",
                answer: "EPS measures the portion of a company's net income allocated to each outstanding share of common stock.\n\nBasic EPS = Net Income − Preferred Dividends\n              ÷ Weighted Avg. Common Shares Outstanding\n\nDiluted EPS includes the effect of convertible securities and options.",
                hint: "Net income divided by shares outstanding.",
                category: .incomeStatement,
                difficulty: .advanced
            )
        ],
        color: .purple
    )

    // MARK: - Cash Flow Deck

    static let cashFlowDeck = Deck(
        id: UUID(),
        title: "Cash Flow Statement",
        description: "Understanding how cash moves through a business",
        category: .cashFlow,
        cards: [
            Flashcard(
                question: "What are the three sections of the Cash Flow Statement?",
                answer: "1. Operating Activities: Cash from core business operations (collections from customers, payments to suppliers and employees)\n\n2. Investing Activities: Cash from buying/selling long-term assets and investments\n\n3. Financing Activities: Cash from debt, equity, and dividends",
                hint: "Operating, Investing, Financing.",
                category: .cashFlow,
                difficulty: .beginner
            ),
            Flashcard(
                question: "What is Free Cash Flow (FCF)?",
                answer: "Free Cash Flow is the cash a company generates after spending on capital expenditures needed to maintain or expand operations.\n\nFormula: FCF = Operating Cash Flow − Capital Expenditures\n\nFCF can be used for dividends, debt repayment, share buybacks, or acquisitions.",
                hint: "Operating cash flow minus capex.",
                category: .cashFlow,
                difficulty: .intermediate
            ),
            Flashcard(
                question: "What is the Indirect Method for Operating Cash Flow?",
                answer: "The Indirect Method starts with Net Income and adjusts for:\n\n(+) Non-cash expenses (depreciation, amortization)\n(+/−) Changes in working capital:\n  • Increase in AR → subtract\n  • Increase in AP → add\n  • Increase in Inventory → subtract\n\nThis is the most common presentation method.",
                hint: "Start with Net Income, adjust for non-cash items and working capital.",
                category: .cashFlow,
                difficulty: .advanced
            ),
            Flashcard(
                question: "What does it mean if a company has positive Net Income but negative Operating Cash Flow?",
                answer: "This is a red flag. It can indicate:\n\n• Aggressive revenue recognition (recording revenue not yet collected)\n• Rapid build-up of receivables or inventory\n• High non-cash revenues\n\nA healthy business should eventually convert profits to cash. Sustained divergence suggests earnings quality issues.",
                hint: "Profit doesn't equal cash—check working capital.",
                category: .cashFlow,
                difficulty: .advanced
            ),
            Flashcard(
                question: "What are Capital Expenditures (CapEx)?",
                answer: "CapEx is money spent to acquire, upgrade, or maintain long-term physical assets such as property, plants, and equipment.\n\nCapEx appears as an outflow in Investing Activities on the Cash Flow Statement.\n\nCapEx is NOT expensed immediately—it is capitalized and depreciated over the asset's life.",
                hint: "Cash spent on long-term physical assets.",
                category: .cashFlow,
                difficulty: .intermediate
            ),
            Flashcard(
                question: "How does an increase in Accounts Receivable affect Operating Cash Flow?",
                answer: "An increase in Accounts Receivable REDUCES Operating Cash Flow.\n\nReason: Revenue was recorded (increasing net income) but cash has NOT yet been collected. This means accrual income overstated cash earnings.\n\nAdjustment in Indirect Method: Subtract the increase in AR.",
                hint: "More AR = less cash collected = lower OCF.",
                category: .cashFlow,
                difficulty: .advanced
            )
        ],
        color: .teal
    )

    // MARK: - Journal Entries Deck

    static let journalEntriesDeck = Deck(
        id: UUID(),
        title: "Journal Entries",
        description: "Record common business transactions",
        category: .journalEntries,
        cards: [
            Flashcard(
                question: "Record: Owner invests $50,000 cash into the business.",
                answer: "Debit  Cash                  $50,000\nCredit Capital (Equity)    $50,000\n\nRationale:\n• Cash (asset) increases → Debit\n• Owner's Capital (equity) increases → Credit",
                hint: "Asset increases, equity increases.",
                category: .journalEntries,
                difficulty: .beginner
            ),
            Flashcard(
                question: "Record: Company borrows $20,000 from a bank.",
                answer: "Debit  Cash                  $20,000\nCredit Notes Payable       $20,000\n\nRationale:\n• Cash (asset) increases → Debit\n• Notes Payable (liability) increases → Credit",
                hint: "Asset up, liability up.",
                category: .journalEntries,
                difficulty: .beginner
            ),
            Flashcard(
                question: "Record: Company pays $2,400 for 12 months of prepaid insurance.",
                answer: "Debit  Prepaid Insurance  $2,400\nCredit Cash                    $2,400\n\nRationale:\n• Prepaid Insurance (asset) increases → Debit\n• Cash (asset) decreases → Credit\n\nNote: $200/month will be expensed as insurance is used.",
                hint: "Swap one asset for another.",
                category: .journalEntries,
                difficulty: .intermediate
            ),
            Flashcard(
                question: "Record: Month-end adjustment—one month of prepaid insurance has expired ($200).",
                answer: "Debit  Insurance Expense   $200\nCredit Prepaid Insurance        $200\n\nRationale:\n• Insurance Expense increases → Debit\n• Prepaid Insurance (asset) decreases → Credit\n\nThis is an Adjusting Entry.",
                hint: "Convert the asset to an expense.",
                category: .journalEntries,
                difficulty: .intermediate
            ),
            Flashcard(
                question: "Record: Sales of $5,000 on credit (cost of inventory was $3,000).",
                answer: "Entry 1 – Record the sale:\nDebit  Accounts Receivable  $5,000\nCredit Sales Revenue                $5,000\n\nEntry 2 – Record COGS:\nDebit  Cost of Goods Sold  $3,000\nCredit Inventory                        $3,000",
                hint: "Two entries: one for revenue, one for cost.",
                category: .journalEntries,
                difficulty: .intermediate
            ),
            Flashcard(
                question: "Record: Company pays $3,000 salary to employees.",
                answer: "Debit  Salaries Expense  $3,000\nCredit Cash                       $3,000\n\nRationale:\n• Salaries Expense increases → Debit\n• Cash (asset) decreases → Credit",
                hint: "Expense up, cash down.",
                category: .journalEntries,
                difficulty: .beginner
            ),
            Flashcard(
                question: "Record: Year-end depreciation of $5,000 on equipment.",
                answer: "Debit  Depreciation Expense            $5,000\nCredit Accumulated Depreciation  $5,000\n\nRationale:\n• Depreciation Expense increases → Debit\n• Accumulated Depreciation (contra-asset) increases → Credit\n\nNote: Cash is NOT affected by depreciation.",
                hint: "Expense up, contra-asset up. No cash involved.",
                category: .journalEntries,
                difficulty: .intermediate
            ),
            Flashcard(
                question: "Record: Company collects $5,000 from a credit customer (Accounts Receivable).",
                answer: "Debit  Cash                          $5,000\nCredit Accounts Receivable  $5,000\n\nRationale:\n• Cash (asset) increases → Debit\n• Accounts Receivable (asset) decreases → Credit\n\nNote: Revenue was already recorded at time of sale.",
                hint: "Convert receivable to cash.",
                category: .journalEntries,
                difficulty: .beginner
            )
        ],
        color: .red
    )

    // MARK: - Financial Ratios Deck

    static let financialRatiosDeck = Deck(
        id: UUID(),
        title: "Financial Ratios",
        description: "Analyze company performance and health",
        category: .ratios,
        cards: [
            Flashcard(
                question: "What is the Current Ratio?",
                answer: "Current Ratio = Current Assets ÷ Current Liabilities\n\nMeasures: Short-term liquidity—can the company pay bills due within a year?\n\nBenchmark: >1.0 is generally healthy; <1.0 may signal liquidity risk.\nTypically 1.5–2.0 is considered comfortable.",
                hint: "Current Assets ÷ Current Liabilities",
                category: .ratios,
                difficulty: .intermediate
            ),
            Flashcard(
                question: "What is the Quick Ratio (Acid-Test)?",
                answer: "Quick Ratio = (Cash + Short-term Investments + Accounts Receivable) ÷ Current Liabilities\n\nOr: (Current Assets − Inventory − Prepaid Expenses) ÷ Current Liabilities\n\nMore conservative than Current Ratio—excludes inventory which may be hard to liquidate quickly.",
                hint: "Like Current Ratio but excludes inventory.",
                category: .ratios,
                difficulty: .intermediate
            ),
            Flashcard(
                question: "What is the Debt-to-Equity Ratio?",
                answer: "Debt-to-Equity (D/E) = Total Liabilities ÷ Total Shareholders' Equity\n\nMeasures: Financial leverage and risk.\n\n• High D/E: More debt-financed, higher financial risk but potential for higher returns\n• Low D/E: More equity-financed, lower risk but may underutilize leverage",
                hint: "Total Liabilities ÷ Total Equity",
                category: .ratios,
                difficulty: .intermediate
            ),
            Flashcard(
                question: "What is Gross Profit Margin?",
                answer: "Gross Profit Margin = (Revenue − COGS) ÷ Revenue × 100%\n\nOr: Gross Profit ÷ Revenue × 100%\n\nMeasures: How efficiently a company produces goods relative to revenue.\n\nHigher margin = better at controlling production costs.",
                hint: "Gross Profit ÷ Revenue × 100%",
                category: .ratios,
                difficulty: .intermediate
            ),
            Flashcard(
                question: "What is Return on Equity (ROE)?",
                answer: "ROE = Net Income ÷ Average Shareholders' Equity × 100%\n\nMeasures: How effectively management uses equity to generate profit.\n\nDuPont Formula: ROE = Net Profit Margin × Asset Turnover × Equity Multiplier\n\nHigher ROE generally indicates more efficient use of equity.",
                hint: "Net Income ÷ Shareholders' Equity",
                category: .ratios,
                difficulty: .advanced
            ),
            Flashcard(
                question: "What is Return on Assets (ROA)?",
                answer: "ROA = Net Income ÷ Average Total Assets × 100%\n\nMeasures: How efficiently a company uses its assets to generate profit.\n\nHigher ROA = more efficient asset utilization.\n\nComparison: ROA < Cost of Debt means the company is destroying value.",
                hint: "Net Income ÷ Total Assets",
                category: .ratios,
                difficulty: .intermediate
            ),
            Flashcard(
                question: "What is Inventory Turnover?",
                answer: "Inventory Turnover = COGS ÷ Average Inventory\n\nMeasures: How many times inventory is sold and replaced in a period.\n\n• High turnover: Fast-moving inventory, efficient management\n• Low turnover: Slow sales or excess inventory\n\nDays Inventory Outstanding = 365 ÷ Inventory Turnover",
                hint: "COGS ÷ Average Inventory",
                category: .ratios,
                difficulty: .advanced
            ),
            Flashcard(
                question: "What is the Price-to-Earnings (P/E) Ratio?",
                answer: "P/E Ratio = Market Price per Share ÷ Earnings Per Share (EPS)\n\nMeasures: How much investors pay per dollar of earnings.\n\n• High P/E: Investors expect high future growth\n• Low P/E: May be undervalued or low growth expectations\n\nComparison to industry peers is essential.",
                hint: "Share Price ÷ EPS",
                category: .ratios,
                difficulty: .advanced
            )
        ],
        color: .indigo
    )

    // MARK: - Terminology Deck

    static let terminologyDeck = Deck(
        id: UUID(),
        title: "Key Terminology",
        description: "Essential accounting vocabulary",
        category: .terminology,
        cards: [
            Flashcard(
                question: "What is GAAP?",
                answer: "GAAP (Generally Accepted Accounting Principles) is a set of standardized accounting rules and guidelines used in the United States.\n\nSet by: FASB (Financial Accounting Standards Board)\n\nRequired for: Public companies filing with the SEC, most private companies in the US.",
                hint: "US accounting standards set by FASB.",
                category: .terminology,
                difficulty: .beginner
            ),
            Flashcard(
                question: "What is IFRS?",
                answer: "IFRS (International Financial Reporting Standards) is a set of accounting standards used in over 140 countries outside the US.\n\nSet by: IASB (International Accounting Standards Board)\n\nKey differences from GAAP: More principles-based, different inventory rules (no LIFO under IFRS).",
                hint: "International accounting standards used outside the US.",
                category: .terminology,
                difficulty: .intermediate
            ),
            Flashcard(
                question: "What is Amortization?",
                answer: "Amortization is the systematic allocation of an intangible asset's cost over its useful life.\n\nSimilar to depreciation, but applies to intangible assets such as:\n• Patents\n• Copyrights\n• Software\n• Customer lists\n\nNote: Goodwill is not amortized under US GAAP (tested for impairment instead).",
                hint: "Spreading an intangible asset's cost over time.",
                category: .terminology,
                difficulty: .intermediate
            ),
            Flashcard(
                question: "What is an Accrual?",
                answer: "An accrual is a revenue or expense that has been earned or incurred but not yet recorded because no cash has changed hands.\n\nTypes:\n• Accrued Revenue: Earned but not yet billed\n• Accrued Expense: Incurred but not yet paid\n\nRecorded via adjusting journal entries at period end.",
                hint: "Revenue earned or expense incurred but not yet in the books.",
                category: .terminology,
                difficulty: .intermediate
            ),
            Flashcard(
                question: "What is a Contra Account?",
                answer: "A Contra Account has a balance opposite to the normal balance of its paired account.\n\nExamples:\n• Accumulated Depreciation (contra to Equipment)\n• Allowance for Doubtful Accounts (contra to AR)\n• Sales Returns (contra to Sales Revenue)\n\nContra accounts reduce the net value of the main account.",
                hint: "An account that offsets a related account.",
                category: .terminology,
                difficulty: .intermediate
            ),
            Flashcard(
                question: "What is the difference between a Deferred Revenue and Unearned Revenue?",
                answer: "They are the same thing!\n\nDeferred Revenue / Unearned Revenue: Cash received before the service is performed or goods are delivered.\n\nIt is recorded as a LIABILITY because the company still owes the service/product.\n\nWhen earned: Debit Unearned Revenue → Credit Revenue.",
                hint: "Cash received before earning it—a liability.",
                category: .terminology,
                difficulty: .intermediate
            ),
            Flashcard(
                question: "What is a Fiscal Year?",
                answer: "A Fiscal Year is any 12-month period a company uses for accounting and reporting purposes.\n\nIt does not have to match the calendar year (Jan 1 – Dec 31).\n\nExamples:\n• Apple: Oct 1 – Sep 30\n• US Federal Government: Oct 1 – Sep 30\n• Retail companies often end Jan 31 (after holiday season)",
                hint: "A company's 12-month reporting period.",
                category: .terminology,
                difficulty: .beginner
            ),
            Flashcard(
                question: "What is the Materiality Principle?",
                answer: "The Materiality Principle states that accounting standards need only be strictly followed for items that are material (significant enough to influence decisions of financial statement users).\n\nImmaterial items may be treated in the most convenient manner.\n\nExample: A $50 stapler may be expensed immediately rather than capitalized and depreciated.",
                hint: "Only significant items need precise accounting treatment.",
                category: .terminology,
                difficulty: .advanced
            )
        ],
        color: .pink
    )
}
