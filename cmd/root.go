package cmd

import (
	"fmt"
	"os"

	"github.com/fuegoers/flowgo/cmd/branch"
	"github.com/fuegoers/flowgo/cmd/open"
	"github.com/spf13/cobra"
)

var rootCmd = &cobra.Command{
	Use:   "flowgo",
	Short: "🔥 FlowGo - Internal FueGo CLI tools",
}

func Execute() {
	rootCmd.AddCommand(branch.NewCommand())
	rootCmd.AddCommand(open.NewCommand())

	if err := rootCmd.Execute(); err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
}

func init() {
	rootCmd.Flags().BoolP("toggle", "t", false, "Help message for toggle")
}
