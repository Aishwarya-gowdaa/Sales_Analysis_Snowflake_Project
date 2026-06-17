import pandas as pd


# 1. LOAD DATA
df = pd.read_csv(
    "data/Superstore_data.csv",
    encoding="cp1252"
)

# 2. STANDARDIZE COLUMN NAMES
df.columns = (
    df.columns
    .str.strip()
    .str.lower()
    .str.replace(" ", "_")
    .str.replace("-","_")
)

# 3. REMOVE DUPLICATES
df = df.drop_duplicates()


# 4. CLEAN HIDDEN CHARACTERS
df = df.replace('\u00A0', ' ', regex=True)

df.columns = df.columns.str.replace('\u00A0', ' ').str.strip()


# 5. FIX DATA TYPES
df["sales"] = pd.to_numeric(df["sales"], errors="coerce")
df["quantity"] = pd.to_numeric(df["quantity"], errors="coerce")
df["profit"] = pd.to_numeric(df["profit"], errors="coerce")

df["order_date"] = pd.to_datetime(df["order_date"], errors="coerce")
df["ship_date"] = pd.to_datetime(df["ship_date"], errors="coerce")

# 6. REMOVE INVALID ROWS
df = df.dropna(subset=["sales", "order_date", "order_id"])
df = df[df["sales"] > 0]
df = df[df["quantity"] > 0]


# 7. FINAL VALIDATION

print("sales info",df.info())
print("total rows",len(df))
print("head",df.head())
print("null values count",df.isnull().sum())


# 8. SAVE CLEAN FILE

df.to_csv("data/superstore_cleaned.csv", index=False)

print("CLEAN FILE CREATED SUCCESSFULLY")